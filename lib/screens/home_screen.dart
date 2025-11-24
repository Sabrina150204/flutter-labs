import 'package:flutter/material.dart';
import '../widgets/habit_card.dart';
import 'stats_screen.dart';
import 'add_habit_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToStats(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StatsScreen()),
    );
  }

  void _navigateToAddHabit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddHabitScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DailyWin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () => _navigateToStats(context),
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
        onPressed: () => _navigateToAddHabit(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}