import 'package:flutter/foundation.dart';
import '../models/habit.dart';
import '../data/repositories/habit_repository.dart';
import '../data/services/api_service.dart';

class HabitViewModel with ChangeNotifier {
  final HabitRepository _habitRepository = HabitRepository();
  final ApiService _apiService = ApiService();
  
  List<Habit> _habits = [];
  Map<String, dynamic>? _motivationalQuote;
  bool _isLoading = false;

  List<Habit> get habits => _habits;
  Map<String, dynamic>? get motivationalQuote => _motivationalQuote;
  bool get isLoading => _isLoading;

  HabitViewModel() {
    loadHabits();
    loadMotivationalQuote();
  }

  Future<void> loadHabits() async {
    print('=== LOADING HABITS ===');
    _isLoading = true;
    notifyListeners();
    
    _habits = await _habitRepository.getHabits();
    print('Loaded ${_habits.length} habits from storage');
    
    // Если привычек нет, добавляем демо-данные
    if (_habits.isEmpty) {
      print('No habits found, creating demo data');
      _habits = [
        Habit(
          id: '1',
          title: 'Утренняя зарядка',
          description: 'Выполнять 10 мин утром',
          streak: 5,
          isCompleted: false,
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
        ),
        Habit(
          id: '2', 
          title: 'Читать книгу',
          description: '30 минут в день',
          streak: 3,
          isCompleted: true,
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
        ),
      ];
      await _habitRepository.saveHabits(_habits);
      print('Demo habits saved');
    }
    
    _isLoading = false;
    notifyListeners();
    print('=== HABITS LOADING COMPLETE ===');
  }

  Future<void> loadMotivationalQuote() async {
    _motivationalQuote = await _apiService.fetchMotivationalQuote();
    notifyListeners();
  }

  Future<void> addHabit(String title, String description) async {
    print('=== ADDING NEW HABIT ===');
    print('Title: $title, Description: $description');
    
    final newHabit = Habit(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      streak: 0,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    
    await _habitRepository.addHabit(newHabit);
    _habits.add(newHabit);
    notifyListeners();
    print('Habit added successfully');
  }

  Future<void> toggleHabitCompletion(String habitId) async {
    print('=== TOGGLE HABIT CALLED: $habitId ===');
    final habitIndex = _habits.indexWhere((habit) => habit.id == habitId);
    print('Habit found at index: $habitIndex');
    
    if (habitIndex != -1) {
      print('Before toggle - isCompleted: ${_habits[habitIndex].isCompleted}');
      final updatedHabit = Habit(
        id: _habits[habitIndex].id,
        title: _habits[habitIndex].title,
        description: _habits[habitIndex].description,
        streak: _habits[habitIndex].isCompleted 
            ? _habits[habitIndex].streak 
            : _habits[habitIndex].streak + 1,
        isCompleted: !_habits[habitIndex].isCompleted,
        createdAt: _habits[habitIndex].createdAt,
      );
      
      await _habitRepository.updateHabit(updatedHabit);
      _habits[habitIndex] = updatedHabit;
      notifyListeners();
      print('Habit toggled successfully');
      print('After toggle - isCompleted: ${_habits[habitIndex].isCompleted}');
    }
  }
}