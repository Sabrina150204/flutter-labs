class Habit {
  final String id;
  final String title;
  final String description;
  final int streak;
  final bool isCompleted;
  final DateTime createdAt;

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.streak,
    required this.isCompleted,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'streak': streak,
      'isCompleted': isCompleted,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      streak: map['streak'] ?? 0,
      isCompleted: map['isCompleted'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
    );
  }
}