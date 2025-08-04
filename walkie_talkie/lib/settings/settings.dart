import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey.shade800),
            child: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildMenuItem(
            icon: Icons.contact_page_outlined,
            title: 'View contact',
            onTap: () => _handleMenuTap(context, 'View contact'),
          ),
          _buildMenuItem(
            icon: Icons.flag_outlined,
            title: 'Report',
            onTap: () => _handleMenuTap(context, 'Report'),
          ),
          _buildMenuItem(
            icon: Icons.block,
            title: 'Block',
            onTap: () => _handleMenuTap(context, 'Block'),
          ),
          _buildMenuItem(
            icon: Icons.search,
            title: 'Search',
            onTap: () => _handleMenuTap(context, 'Search'),
          ),
          _buildMenuItem(
            icon: Icons.notifications_off_outlined,
            title: 'Unmute notifications',
            isDisabled: true,
            onTap: () => _handleMenuTap(context, 'Unmute notifications'),
          ),
          _buildMenuItem(
            icon: Icons.timer_outlined,
            title: 'Disappearing messages',
            onTap: () => _handleMenuTap(context, 'Disappearing messages'),
          ),
          _buildMenuItem(
            icon: Icons.wallpaper_outlined,
            title: 'Wallpaper',
            onTap: () => _handleMenuTap(context, 'Wallpaper'),
          ),
          _buildMenuItem(
            icon: Icons.more_horiz,
            title: 'More',
            hasArrow: true,
            onTap: () => _handleMenuTap(context, 'More'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDisabled = false,
    bool hasArrow = false,
  }) {
    return Opacity(
      opacity: isDisabled ? 0.5 : 1,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: isDisabled ? null : onTap,
          borderRadius: BorderRadius.circular(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              children: [
                Icon(icon, size: 20, color: Colors.grey.shade600),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (hasArrow)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuTap(BuildContext context, String menuItem) {
    print('Tapped: $menuItem');
    Navigator.pop(context); // Close the drawer after tap
    // Handle menu item tap here
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: const Center(child: Text('Main Content Here')),
      drawer: const SettingsDrawer(),
    );
  }
}
