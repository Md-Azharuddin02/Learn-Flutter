import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
```

---

## features/chat/screens/chat_list_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_list_controller.dart';
import '../widgets/chat_tile.dart';
import '../../../core/utils/constants.dart';

class ChatListScreen extends StatelessWidget {
  final ChatListController controller = Get.put(ChatListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.chats),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (controller.chats.isEmpty) {
          return const Center(
            child: Text('No chats yet'),
          );
        }

        return ListView.builder(
          itemCount: controller.chats.length,
          itemBuilder: (context, index) {
            final chat = controller.chats[index];
            return ChatTile(
              chat: chat,
              onTap: () => controller.openChat(chat),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement new chat
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}