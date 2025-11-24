import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/habit_view_model.dart';
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
    final habitViewModel = Provider.of<HabitViewModel>(context);

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
      body: habitViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: habitViewModel.habits.map((habit) {
                return HabitCard(
                  habit: habit,
                  onToggle: () => habitViewModel.toggleHabitCompletion(habit.id),
                );
              }).toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddHabit(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}