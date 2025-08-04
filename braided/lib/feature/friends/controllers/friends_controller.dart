import 'package:get/get.dart';
import '../../../core/models/user.dart';
import '../../../core/services/auth_service.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_routes.dart';

class FriendsController extends GetxController {
  final AuthService _authService = Get.find();
  final ApiService _apiService = ApiService();
  
  final RxList<User> friends = <User>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadFriends();
  }

  Future<void> loadFriends() async {
    try {
      isLoading.value = true;
      // In a real app, you'd have an API endpoint for friends
      // For now, we'll simulate some data
      await Future.delayed(const Duration(seconds: 1));
      friends.assignAll([
        User(
          id: '1',
          phoneNumber: '+1234567890',
          name: 'John Doe',
          isOnline: true,
        ),
        User(
          id: '2',
          phoneNumber: '+1234567891',
          name: 'Jane Smith',
          isOnline: false,
          lastSeen: DateTime.now().subtract(const Duration(hours: 2)),
        ),
      ]);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load friends');
    } finally {
      isLoading.value = false;
    }
  }

  void addFriend() {
    Get.dialog(
      AlertDialog(
        title: const Text('Add Friend'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Enter phone number',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar('Success', 'Friend request sent');
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void startChat(User friend) {
    // Create a chat with this friend and navigate to chat detail
    Get.toNamed(AppRoutes.chatDetail, arguments: friend);
  }

  void makeCall(User friend) {
    Get.snackbar('Info', 'Calling ${friend.name}...');
  }
}