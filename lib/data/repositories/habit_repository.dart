import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/habit.dart';

class HabitRepository {
  static const String _habitsKey = 'habits';

  Future<List<Habit>> getHabits() async {
    print('=== GET HABITS FROM STORAGE ===');
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = prefs.getStringList(_habitsKey) ?? [];
    print('Found ${habitsJson.length} habits in storage');
    
    final habits = <Habit>[];
    for (final json in habitsJson) {
      try {
        final map = jsonDecode(json) as Map<String, dynamic>;
        habits.add(Habit.fromMap(map));
      } catch (e) {
        print('Error parsing habit: $e');
      }
    }
    
    print('Parsed ${habits.length} habits');
    return habits;
  }

  Future<void> saveHabits(List<Habit> habits) async {
    print('=== SAVING HABITS TO STORAGE ===');
    print('Saving ${habits.length} habits');
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = habits.map((habit) => jsonEncode(habit.toMap())).toList();
    await prefs.setStringList(_habitsKey, habitsJson);
    print('Habits saved successfully');
  }

  Future<void> addHabit(Habit habit) async {
    print('=== REPOSITORY: ADD HABIT ===');
    final habits = await getHabits();
    habits.add(habit);
    await saveHabits(habits);
  }

  Future<void> updateHabit(Habit updatedHabit) async {
    print('=== REPOSITORY: UPDATE HABIT ===');
    final habits = await getHabits();
    final index = habits.indexWhere((habit) => habit.id == updatedHabit.id);
    if (index != -1) {
      habits[index] = updatedHabit;
      await saveHabits(habits);
    }
  }

  Future<void> deleteHabit(String habitId) async {
    final habits = await getHabits();
    habits.removeWhere((habit) => habit.id == habitId);
    await saveHabits(habits);
  }
}