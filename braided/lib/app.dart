import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return getMaterialApp(
    return MaterialApp(
      title: 'Chat App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Text("data"),
      // themeMode: ThemeMode.system,
      // initialRoute: AppRoutes.login,
      // getPages: AppRoutes.routes,
      // debugShowCheckedModeBanner: false,
    );
  }
}
