import 'package:flutter/material.dart';
import './Auth/login.dart';
import './user/friend_list.dart';
import './Chat/chat.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/register': (context) => PhoneVerificationScreen(),
        '/friend-list': (context) => ChatListScreen(),
      },
      home: ChatListScreen(),
    );
  }
}

void main() {
  runApp(const App());
}
