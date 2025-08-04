import 'package:flutter/material.dart';
import '../Chat/chat.dart';
import '../settings/settings.dart';

// 1. Define a chat model for clarity
class ChatItem {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final int unread;

  const ChatItem({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
  });
}

// 2. Make chat data typed and const
const List<ChatItem> _chats = [
  ChatItem(
    id: "1",
    name: "Emma Johnson",
    lastMessage: "Are we still on for today?",
    time: "11:20 AM",
    unread: 1,
  ),
  ChatItem(
    id: "2",
    name: "Liam Smith",
    lastMessage: "I'll call you in 5 mins.",
    time: "2:45 PM",
    unread: 0,
  ),
  ChatItem(
    id: "3",
    name: "Olivia Davis",
    lastMessage: "Got the files, thanks!",
    time: "9:15 AM",
    unread: 3,
  ),
  ChatItem(
    id: "4",
    name: "Noah Brown",
    lastMessage: "Let me know when you're free.",
    time: "8:50 PM",
    unread: 2,
  ),
  ChatItem(
    id: "5",
    name: "Ava Miller",
    lastMessage: "Meeting is at 4.",
    time: "3:10 PM",
    unread: 1,
  ),
  ChatItem(
    id: "6",
    name: "William Wilson",
    lastMessage: "Done with the task.",
    time: "6:00 PM",
    unread: 0,
  ),
  ChatItem(
    id: "7",
    name: "Sophia Moore",
    lastMessage: "Lunch tomorrow?",
    time: "12:30 PM",
    unread: 4,
  ),
  ChatItem(
    id: "8",
    name: "James Taylor",
    lastMessage: "Looks good to me.",
    time: "10:05 AM",
    unread: 0,
  ),
  ChatItem(
    id: "9",
    name: "Isabella Anderson",
    lastMessage: "Sent the email.",
    time: "1:20 PM",
    unread: 2,
  ),
  ChatItem(
    id: "10",
    name: "Benjamin Thomas",
    lastMessage: "What's the update?",
    time: "5:30 PM",
    unread: 1,
  ),
  ChatItem(
    id: "11",
    name: "Mia Jackson",
    lastMessage: "Okay cool!",
    time: "7:45 PM",
    unread: 0,
  ),
  ChatItem(
    id: "12",
    name: "Elijah White",
    lastMessage: "On the way.",
    time: "4:55 PM",
    unread: 1,
  ),
  ChatItem(
    id: "13",
    name: "Charlotte Harris",
    lastMessage: "See you then!",
    time: "11:00 AM",
    unread: 0,
  ),
  ChatItem(
    id: "14",
    name: "Lucas Martin",
    lastMessage: "Please review this.",
    time: "2:15 PM",
    unread: 3,
  ),
  ChatItem(
    id: "15",
    name: "Amelia Thompson",
    lastMessage: "Happy birthday!",
    time: "9:50 AM",
    unread: 0,
  ),
  ChatItem(
    id: "16",
    name: "Henry Garcia",
    lastMessage: "Joining in 2 mins.",
    time: "6:25 PM",
    unread: 1,
  ),
  ChatItem(
    id: "17",
    name: "Evelyn Martinez",
    lastMessage: "Call me when free.",
    time: "10:40 AM",
    unread: 1,
  ),
  ChatItem(
    id: "18",
    name: "Alexander Robinson",
    lastMessage: "Yep, confirmed.",
    time: "1:05 PM",
    unread: 0,
  ),
  ChatItem(
    id: "19",
    name: "Harper Clark",
    lastMessage: "Will update you soon.",
    time: "8:30 AM",
    unread: 2,
  ),
  ChatItem(
    id: "20",
    name: "Michael Rodriguez",
    lastMessage: "Let's catch up!",
    time: "3:45 PM",
    unread: 0,
  ),
];

// 3. Entry widget - Now StatefulWidget to handle dropdown state
class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  bool _showDropdown = false;

  void _toggleDropdown() {
    setState(() {
      _showDropdown = !_showDropdown;
    });
  }

  void _hideDropdown() {
    if (_showDropdown) {
      setState(() {
        _showDropdown = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                  "Chats",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.black),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Text('add')),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.black),
                    onPressed: _toggleDropdown,
                  ),
                ],
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              const _SearchBox(),
              const _ChatTabs(),
              Expanded(child: const _ChatList()),
              const _BottomNavBar(),
            ],
          ),

          // Dropdown menu overlay with invisible barrier
          if (_showDropdown)
            Positioned.fill(
              child: GestureDetector(
                onTap: _hideDropdown,
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  children: [
                    Positioned(
                      top: 90, // Adjust based on AppBar height
                      right: 16,
                      child: GestureDetector(
                        onTap: () {}, // Prevent tap from bubbling up
                        child: _DropdownMenu(onItemTap: _hideDropdown),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// New Dropdown Menu Widget
class _DropdownMenu extends StatelessWidget {
  final VoidCallback onItemTap;

  const _DropdownMenu({required this.onItemTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DropdownItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                onItemTap();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PlaceholderScreen(title: 'Settings'),
                  ),
                );
              },
            ),
            _DropdownItem(
              icon: Icons.archive,
              title: 'Archived Chats',
              onTap: () {
                onItemTap();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const PlaceholderScreen(title: 'Archived Chats'),
                  ),
                );
              },
            ),
            _DropdownItem(
              icon: Icons.star,
              title: 'Starred Messages',
              onTap: () {
                onItemTap();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const PlaceholderScreen(title: 'Starred Messages'),
                  ),
                );
              },
            ),
            _DropdownItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {
                onItemTap();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const PlaceholderScreen(title: 'Help & Support'),
                  ),
                );
              },
            ),
            _DropdownItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                onItemTap();
                // Handle logout
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Logout clicked')));
              },
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

// Dropdown Item Widget
class _DropdownItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLast;

  const _DropdownItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLast = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.vertical(
          top: title == 'Settings' ? const Radius.circular(12) : Radius.zero,
          bottom: isLast ? const Radius.circular(12) : Radius.zero,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey[700], size: 20),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 4. Search Box
class _SearchBox extends StatelessWidget {
  const _SearchBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search chats...",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

// 5. Tabs row
class _ChatTabs extends StatelessWidget {
  const _ChatTabs({super.key});
  @override
  Widget build(BuildContext context) {
    const tabs = ["ALL", "Unread", "Favourite", "Groups"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: List.generate(
          tabs.length,
          (i) => _ChatTab(
            tabs[i],
            i == 0, // Only first tab selected for demo
            isLast: i == tabs.length - 1,
          ),
        ),
      ),
    );
  }
}

class _ChatTab extends StatelessWidget {
  final String label;
  final bool selected;
  final bool isLast;
  const _ChatTab(this.label, this.selected, {this.isLast = false, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isLast ? 0 : 16),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFE6F4EA) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xFF19C37D) : Colors.black87,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// 6. Chat List (separated for performance)
class _ChatList extends StatelessWidget {
  const _ChatList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _chats.length,
      separatorBuilder: (_, __) => const SizedBox(height: 2),
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return _ChatTile(
          chat: chat,
          highlight: index == 10,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(chat: chat), // Pass user data!
            ),
          ),
        );
      },
    );
  }
}

// 7. Chat tile
class _ChatTile extends StatelessWidget {
  final ChatItem chat;
  final bool highlight;
  final VoidCallback onTap;

  const _ChatTile({
    required this.chat,
    required this.onTap,
    this.highlight = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hasUnread = chat.unread > 0;
    return Material(
      color: highlight ? const Color(0xFFF6F8FB) : Colors.transparent,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
        leading: const CircleAvatar(
          radius: 23,
          backgroundColor: Color(0xFFE3E9F2),
          child: Icon(Icons.person, color: Colors.grey, size: 28),
        ),
        title: Text(
          chat.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          chat.lastMessage,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: hasUnread ? Colors.black : Colors.grey[600],
            fontWeight: hasUnread ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              chat.time,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            if (hasUnread)
              Container(
                margin: const EdgeInsets.only(top: 6),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(
                  chat.unread.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// 8. Bottom Navigation Bar
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.mail, Colors.blue[700], const ChatListScreen(), "Mail"),
      (
        Icons.pets_outlined,
        Colors.grey[600],
        const PlaceholderScreen(title: "Pets"),
        "Pets",
      ),
      (
        Icons.verified_user,
        Colors.grey[600],
        const PlaceholderScreen(title: "Verified"),
        "Verified",
      ),
      (
        Icons.settings,
        Colors.grey[600],
        const PlaceholderScreen(title: "Settings"),
        "Settings",
      ),
      (
        Icons.person,
        Colors.grey[600],
        const PlaceholderScreen(title: "Profile"),
        "Profile",
      ),
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 8, 14, 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          return IconButton(
            icon: Icon(item.$1, color: item.$2),
            tooltip: item.$4,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.$3),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// 9. PlaceholderScreen
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Text('This is $title screen')),
  );
}
