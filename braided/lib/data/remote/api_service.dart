import 'package:dio/dio.dart';
import '../../core/utils/constants.dart';
import '../../core/models/user.dart';
import '../../core/models/chat.dart';
import '../../core/models/message.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
  }

  // User APIs
  Future<User> getUserProfile(String userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get user profile');
    }
  }

  // Chat APIs
  Future<List<Chat>> getUserChats(String userId) async {
    try {
      final response = await _dio.get('/users/$userId/chats');
      return (response.data as List)
          .map((chat) => Chat.fromJson(chat))
          .toList();
    } catch (e) {
      throw Exception('Failed to get chats');
    }
  }

  // Message APIs
  Future<List<Message>> getChatMessages(String chatId, {int page = 1}) async {
    try {
      final response = await _dio.get(
        '/chats/$chatId/messages',
        queryParameters: {'page': page},
      );
      return (response.data as List)
          .map((message) => Message.fromJson(message))
          .toList();
    } catch (e) {
      throw Exception('Failed to get messages');
    }
  }

  Future<Message> sendMessage(Message message) async {
    try {
      final response = await _dio.post('/messages', data: message.toJson());
      return Message.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to send message');
    }
  }

  // Bot Chat API
  Future<Message> sendBotMessage(String message) async {
    try {
      final response = await _dio.post('/bot/chat', data: {'message': message});
      return Message.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get bot response');
    }
  }
}
