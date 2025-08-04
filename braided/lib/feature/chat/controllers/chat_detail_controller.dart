import 'package:get/get.dart';
import '../../../core/models/message.dart';
import '../../../core/models/chat.dart';
import '../../../core/services/auth_service.dart';
import '../../../data/remote/api_service.dart';

class ChatDetailController extends GetxController {
  final AuthService _authService = Get.find();
  final ApiService _apiService = ApiService();

  final RxList<Message> messages = <Message>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isTyping = false.obs;

  late Chat currentChat;

  @override
  void onInit() {
    super.onInit();
    currentChat = Get.arguments as Chat;
    loadMessages();
  }

  Future<void> loadMessages() async {
    try {
      isLoading.value = true;
      final messageList = await _apiService.getChatMessages(currentChat.id);
      messages.assignAll(messageList.reversed);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load messages');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: currentChat.id,
      senderId: _authService.currentUser!.id,
      content: content,
      type: MessageType.text,
      status: MessageStatus.sent,
      timestamp: DateTime.now(),
    );

    // Add message to UI immediately
    messages.insert(0, message);

    try {
      // Send to server
      await _apiService.sendMessage(message);
    } catch (e) {
      // Remove message if failed
      messages.remove(message);
      Get.snackbar('Error', 'Failed to send message');
    }
  }

  bool isMyMessage(Message message) {
    return message.senderId == _authService.currentUser?.id;
  }

  void setTyping(bool typing) {
    isTyping.value = typing;
  }
}
