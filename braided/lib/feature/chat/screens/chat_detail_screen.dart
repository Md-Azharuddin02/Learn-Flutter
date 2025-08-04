import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_detail_controller.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';
import '../../../core/models/chat.dart';
import '../../../core/utils/constants.dart';

class ChatDetailScreen extends StatelessWidget {
  final ChatDetailController controller = Get.put(ChatDetailController());

  @override
  Widget build(BuildContext context) {
    final Chat chat = Get.arguments as Chat;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(chat.name),
            Obx(
              () => Text(
                controller.isTyping.value
                    ? AppStrings.typing
                    : AppStrings.online,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // Implement voice call
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Implement video call
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.messages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(16),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return MessageBubble(
                    message: message,
                    isMe: controller.isMyMessage(message),
                  );
                },
              );
            }),
          ),
          MessageInput(
            onSendMessage: controller.sendMessage,
            onTyping: controller.setTyping,
          ),
        ],
      ),
    );
  }
}
