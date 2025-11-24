import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;
  final VoidCallback onToggle;

  const HabitCard({
    super.key,
    required this.habit,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Checkbox(
          value: habit.isCompleted,
          onChanged: (value) => onToggle(),
        ),
        title: Text(
          habit.title,
          style: habit.isCompleted
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.description),
            const SizedBox(height: 4),
            Text('🔥 Дней подряд: ${habit.streak}'),
          ],
        ),
      ),
    );
  }
}