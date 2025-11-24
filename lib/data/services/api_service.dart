import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  
  Future<Map<String, dynamic>> fetchMotivationalQuote() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/posts/1'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'quote': data['title'] ?? 'Маленькие шаги приводят к большим результатам!',
          'author': 'Daily Motivation',
        };
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      // Если API не доступно, возвращаем локальную цитату
      return {
        'quote': 'Каждый день - новая возможность стать лучше!',
        'author': 'DailyWin',
      };
    }
  }
}