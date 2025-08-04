import 'package:get/get.dart';
import '../../../core/models/message.dart';
import '../../../core/services/auth_service.dart';
import '../../../data/remote/api_service.dart';

class BotChatController extends GetxController {
  final AuthService _authService = Get.find();
  final ApiService _apiService = ApiService();

  final RxList<Message> messages = <Message>[].obs;
  final RxBool isTyping = false.obs;

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    // Add user message
    final userMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: 'bot_chat',
      senderId: _authService.currentUser!.id,
      content: content,
      type: MessageType.text,
      status: MessageStatus.sent,
      timestamp: DateTime.now(),
    );

    messages.insert(0, userMessage);
    isTyping.value = true;

    try {
      // Get bot response
      final botResponse = await _apiService.sendBotMessage(content);
      messages.insert(0, botResponse);
    } catch (e) {
      // Add error message
      final errorMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        chatId: 'bot_chat',
        senderId: 'bot',
        content:
            'Sorry, I\'m having trouble responding right now. Please try again.',
        type: MessageType.text,
        status: MessageStatus.delivered,
        timestamp: DateTime.now(),
      );
      messages.insert(0, errorMessage);
    } finally {
      isTyping.value = false;
    }
  }

  bool isMyMessage(Message message) {
    return message.senderId == _authService.currentUser?.id;
  }

  void clearChat() {
    messages.clear();
  }
}
