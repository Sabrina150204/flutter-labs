import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final String title;
  final String description;
  final int streak;
  final bool isCompleted;

  const HabitCard({
    super.key,
    required this.title,
    required this.description,
    required this.streak,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: null,
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            Text('🔥 Дней подряд: $streak'),
          ],
        ),
      ),
    );
  }
}