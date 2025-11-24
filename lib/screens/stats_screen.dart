import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Прогресс'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📈 Ваш прогресс за неделю:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDayProgress('Пн: ', [true, true, true, false, true, true, false]),
            _buildDayProgress('Вт: ', [true, true, false, true, true, true, true]),
            _buildDayProgress('Ср: ', [true, false, true, true, false, true, true]),
            const SizedBox(height: 24),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '💫 Сегодняшняя мотивация:\n"Маленькие ежедневные улучшения приводят к большим результатам"',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayProgress(String day, List<bool> progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(day),
          ),
          ...progress.map((isDone) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: isDone ? Colors.green : Colors.grey,
              shape: BoxShape.circle,
            ),
          )),
        ],
      ),
    );
  }
}