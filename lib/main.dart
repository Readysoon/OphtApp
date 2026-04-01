import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const OphtApp());
}

class OphtApp extends StatelessWidget {
  const OphtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AugenCheck',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
