import 'package:get/get.dart';
import '../models/user.dart';
import '../../data/local/local_storage_service.dart';
import '../../data/remote/api_service.dart';

class AuthService extends GetxService {
  final LocalStorageService _localStorage = Get.find();
  final ApiService _apiService = ApiService();

  final Rx<User?> _currentUser = Rx<User?>(null);
  User? get currentUser => _currentUser.value;

  final RxBool _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
  }

  void _checkAuthStatus() async {
    try {
      final userData = await _localStorage.getUserData();
      if (userData != null) {
        _currentUser.value = User.fromJson(userData);
        _isLoggedIn.value = true;
      }
    } catch (e) {
      print('Error checking auth status: $e');
      // Reset auth state on error
      _currentUser.value = null;
      _isLoggedIn.value = false;
    }
  }

  Future<bool> sendOTP(String phoneNumber) async {
    try {
      // Call your backend API to send OTP instead of Firebase
      final response = await _apiService.post('/auth/send-otp', {
        'phoneNumber': phoneNumber,
      });

      if (response != null && response['success'] == true) {
        // Store any necessary data for OTP verification
        await _localStorage.setString('phoneNumber', phoneNumber);
        if (response['verificationId'] != null) {
          await _localStorage.setString(
            'verificationId',
            response['verificationId'],
          );
        }
        return true;
      }
      return false;
    } catch (e) {
      print('Error sending OTP: $e');
      return false;
    }
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      final phoneNumber = await _localStorage.getString('phoneNumber');
      final verificationId = await _localStorage.getString('verificationId');

      if (phoneNumber == null || phoneNumber.isEmpty) {
        print('Phone number not found for OTP verification');
        return false;
      }

      // Call your backend API to verify OTP instead of Firebase
      final response = await _apiService.post('/auth/verify-otp', {
        'phoneNumber': phoneNumber,
        'otp': otp,
        'verificationId': verificationId,
      });

      if (response != null &&
          response['success'] == true &&
          response['user'] != null) {
        final user = User.fromJson(response['user']);

        await _localStorage.setUserData(user.toJson());
        _currentUser.value = user;
        _isLoggedIn.value = true;

        // Clean up temporary data
        await _localStorage.remove('phoneNumber');
        await _localStorage.remove('verificationId');

        return true;
      }
      return false;
    } catch (e) {
      print('Error verifying OTP: $e');
      return false;
    }
  }

  Future<void> logout() async {
    try {
      // Call your backend API to handle logout if needed
      await _apiService.post('/auth/logout', {});
    } catch (e) {
      print('Error during API logout: $e');
      // Continue with local logout even if API call fails
    }

    try {
      await _localStorage.clearUserData();
      await _localStorage.remove('phoneNumber');
      await _localStorage.remove('verificationId');
      _currentUser.value = null;
      _isLoggedIn.value = false;
    } catch (e) {
      print('Error clearing local data: $e');
      // Force reset the observables even if local storage fails
      _currentUser.value = null;
      _isLoggedIn.value = false;
    }
  }
}
