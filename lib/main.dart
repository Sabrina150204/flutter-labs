import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/habit_view_model.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HabitViewModel(),
      child: MaterialApp(
        title: 'DailyWin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}