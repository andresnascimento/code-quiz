import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/question_model.dart';

class Questions with ChangeNotifier {
  List<Question> _questions;
  String _categorySelected;

  int _currentQuestionIndex = 0;

  List<Question> get questions {
    return [..._questions];
  }

  String get categorySelected {
    return _categorySelected;
  }

  int get currentQuestionIndex {
    return _currentQuestionIndex;
  }

  void nextQuestion() {
    _currentQuestionIndex++;
    notifyListeners();
  }

  // int getAnswersLength() {
  //   return _questions[currentQuestionIndex].answers.toJson().length;
  // }

  void selectCategory(String category) {
    _categorySelected = category;
    notifyListeners();
  }

  Future<void> fetchQuestions() async {
    String apiKey = 'rRugdBWczdMjHKjQR0Z8DnqpjmXyn3Q8Vh6H47ja';
    final url = Uri.parse(
        'https://quizapi.io/api/v1/questions?apiKey=$apiKey&limit=2&tags=$_categorySelected');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _questions = quizFromJson(response.body);
        notifyListeners();

        print(_questions[currentQuestionIndex].answers.toJson());
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      throw error;
      //TODO add the error message on the screen
    }
  }
}
