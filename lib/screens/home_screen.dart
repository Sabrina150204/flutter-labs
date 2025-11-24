import 'package:flutter/material.dart';
import '../widgets/habit_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DailyWin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: null,
          ),
        ],
      ),
      body: ListView(
        children: const [
          HabitCard(
            title: 'Утренняя зарядка',
            description: 'Выполнять 10 мин утром',
            streak: 5,
            isCompleted: false,
          ),
          HabitCard(
            title: 'Читать книгу',
            description: '30 минут в день',
            streak: 3,
            isCompleted: true,
          ),
          HabitCard(
            title: 'Пить воду',
            description: '8 стаканов в день',
            streak: 7,
            isCompleted: false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.add),
      ),
    );
  }
}