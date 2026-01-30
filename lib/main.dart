import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const SmartVillageApp());
}

class SmartVillageApp extends StatelessWidget {
  const SmartVillageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Village',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}
