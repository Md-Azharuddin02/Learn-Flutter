import 'package:flutter/material.dart';
import '../../../core/models/user.dart';
import '../../../core/theme/app_theme.dart';

class FriendTile extends StatelessWidget {
  final User friend;
  final VoidCallback onTap;
  final VoidCallback onCall;

  const FriendTile({
    Key? key,
    required this.friend,
    required this.onTap,
    required this.onCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: friend.avatar != null
                ? NetworkImage(friend.avatar!)
                : null,
            child: friend.avatar == null
                ? Text(friend.name?[0].toUpperCase() ?? friend.phoneNumber[0])
                : null,
          ),
          if (friend.isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        friend.name ?? friend.phoneNumber,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        friend.isOnline
            ? 'Online'
            : friend.lastSeen != null
            ? 'Last seen ${_formatLastSeen(friend.lastSeen!)}'
            : 'Offline',
        style: TextStyle(
          color: friend.isOnline ? AppTheme.secondaryColor : Colors.grey[600],
        ),
      ),
      trailing: IconButton(icon: const Icon(Icons.phone), onPressed: onCall),
    );
  }

  String _formatLastSeen(DateTime lastSeen) {
    final now = DateTime.now();
    final difference = now.difference(lastSeen);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }
}
