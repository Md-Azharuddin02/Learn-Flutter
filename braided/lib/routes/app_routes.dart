import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../feature/auth/screens/login_screen.dart';

class AppRoutes {
  static const String login = '/login';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginScreen()),
    // You can add more routes here, e.g. for dashboard:
    // GetPage(name: dashboard, page: () => DashboardScreen()),
  ];
}

class GetPage {}
