import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../chat/screens/chat_list_screen.dart';
import '../../friends/screens/friends_screen.dart';
import '../../bot_chat/screens/bot_chat_screen.dart';
import '../../../core/utils/constants.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [ChatListScreen(), FriendsScreen(), BotChatScreen()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: AppStrings.chats,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: AppStrings.friends,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: AppStrings.botChat,
            ),
          ],
        ),
      ),
    );
  }
}
