import 'package:get/get.dart';
import '../../../core/models/chat.dart';
import '../../../core/services/auth_service.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_routes.dart';

class ChatListController extends GetxController {
  final AuthService _authService = Get.find();
  final ApiService _apiService = ApiService();
  
  final RxList<Chat> chats = <Chat>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadChats();
  }

  Future<void> loadChats() async {
    try {
      isLoading.value = true;
      final userId = _authService.currentUser?.id;
      if (userId != null) {
        final chatList = await _apiService.getUserChats(userId);
        chats.assignAll(chatList);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load chats');
    } finally {
      isLoading.value = false;
    }
  }

  void openChat(Chat chat) {
    Get.toNamed(AppRoutes.chatDetail, arguments: chat);
  }

  Future<void> refreshChats() async {
    await loadChats();
  }
}
```

---

## features/chat/widgets/chat_tile.dart
```dart
import 'package:flutter/material.dart';
import '../../../core/models/chat.dart';
import '../../../core/utils/constants.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatTile({
    Key? key,
    required this.chat,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: chat.avatar != null 
            ? NetworkImage(chat.avatar!) 
            : null,
        child: chat.avatar == null 
            ? Text(chat.name[0].toUpperCase()) 
            : null,
      ),
      title: Text(
        chat.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        chat.lastMessage?.content ?? 'No messages yet',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (chat.lastActivity != null)
            Text(
              _formatTime(chat.lastActivity!),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          if (chat.unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}