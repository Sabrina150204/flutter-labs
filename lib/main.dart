import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
// import 'screens/stats_screen.dart'; // Можно закомментировать или оставить

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(), 
    );
  }
}