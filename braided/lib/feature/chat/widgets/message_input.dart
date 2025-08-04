import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class MessageInput extends StatefulWidget {
  final Function(String) onSendMessage;
  final Function(bool) onTyping;

  const MessageInput({
    Key? key,
    required this.onSendMessage,
    required this.onTyping,
  }) : super(key: key);

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: () {
                // Implement file attachment
              },
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                maxLines: null,
                onChanged: (text) {
                  final typing = text.isNotEmpty;
                  if (typing != _isTyping) {
                    _isTyping = typing;
                    widget.onTyping(typing);
                  }
                },
                onSubmitted: _sendMessage,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mic),
              onPressed: () {
                // Implement voice message
              },
            ),
            IconButton(
              icon: const Icon(Icons.send, color: AppTheme.primaryColor),
              onPressed: () => _sendMessage(_controller.text),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      widget.onSendMessage(text);
      _controller.clear();
      widget.onTyping(false);
      _isTyping = false;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
