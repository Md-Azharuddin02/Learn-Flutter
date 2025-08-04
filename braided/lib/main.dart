import 'package:flutter/material.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    runApp(MyApp());
  } catch (e, stack) {
    // In production, show a nice error UI or send logs to Crashlytics
    debugPrint('Startup error: $e');
    debugPrintStack(stackTrace: stack);
    runApp(
      MaterialApp(
        home: Scaffold(body: Center(child: Text('App failed to start: $e'))),
      ),
    );
  }
}
