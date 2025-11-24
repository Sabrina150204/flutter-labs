import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/habit_view_model.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final habitViewModel = Provider.of<HabitViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая привычка'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Название привычки',
                hintText: 'Например: Бег по утрам',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Описание',
                hintText: 'Например: 20 минут утром',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  habitViewModel.addHabit(
                    _titleController.text,
                    _descriptionController.text,
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Привычка добавлена!')),
                  );
                }
              },
              child: const Text('СОЗДАТЬ ПРИВЫЧКУ'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}