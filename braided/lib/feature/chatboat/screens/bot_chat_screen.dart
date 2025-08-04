import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bot_chat_controller.dart';
import '../../chat/widgets/message_bubble.dart';
import '../../chat/widgets/message_input.dart';
import '../../../core/utils/constants.dart';

class BotChatScreen extends StatelessWidget {
  final BotChatController controller = Get.put(BotChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.botChat),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.clearChat,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.messages.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.smart_toy, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'Start a conversation with AI',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
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
          Obx(
            () => controller.isTyping.value
                ? Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const CircularProgressIndicator(strokeWidth: 2),
                        const SizedBox(width: 12),
                        Text(
                          'AI is thinking...',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          MessageInput(
            onSendMessage: controller.sendMessage,
            onTyping: (typing) {},
          ),
        ],
      ),
    );
  }
}
