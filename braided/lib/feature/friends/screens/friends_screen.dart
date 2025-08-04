import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/friends_controller.dart';
import '../widgets/friend_tile.dart';
import '../../../core/utils/constants.dart';

class FriendsScreen extends StatelessWidget {
  final FriendsController controller = Get.put(FriendsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.friends),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: controller.addFriend,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.friends.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No friends yet',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: controller.addFriend,
                  child: const Text('Add your first friend'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.friends.length,
          itemBuilder: (context, index) {
            final friend = controller.friends[index];
            return FriendTile(
              friend: friend,
              onTap: () => controller.startChat(friend),
              onCall: () => controller.makeCall(friend),
            );
          },
        );
      }),
    );
  }
}
