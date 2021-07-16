import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/question_model.dart';

//TODO add check anwser logic

class Questions with ChangeNotifier {
  List<Question>? _questions;
  var isDone = false;

  String? _categorySelected;

  int _currentQuestionIndex = 0;

  String? _selectedAnswer;

  int _score = 0;

  Future<void> fetchQuestions() async {
    String apiKey = 'rRugdBWczdMjHKjQR0Z8DnqpjmXyn3Q8Vh6H47ja';
    final url = Uri.parse(
        'https://quizapi.io/api/v1/questions?apiKey=$apiKey&limit=2&tags=$_categorySelected');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _questions = quizFromJson(response.body);
        notifyListeners();

        print(_questions![currentQuestionIndex].answers);
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      throw error;
      //TODO add the error message on the screen
    }
  }

  List<Question>? get questions {
    if (_questions != null) return [..._questions!];
  }

  String? get categorySelected {
    return _categorySelected;
  }

  int get currentQuestionIndex {
    return _currentQuestionIndex;
  }

  int get score {
    return _score;
  }

  void nextQuestion() {
    if (_currentQuestionIndex >= (_questions!.length - 1)) {
      isDone = true;
      notifyListeners();
      print('finished');
    } else {
      _currentQuestionIndex++;
      notifyListeners();
    }
    print(_questions![_currentQuestionIndex].correctAnswer);
    print(_questions![_currentQuestionIndex].multipleCorrectAnswers);
  }

  void setSelectedAnswer(String selectedAnswer) {
    _selectedAnswer = selectedAnswer;
    notifyListeners();
  }

  String? correctAnswer() {
    var answer = _questions![_currentQuestionIndex].correctAnswer.toString();

    var answersList = _questions![_currentQuestionIndex].answers!.toJson();

    print(answer);

    print('the correct answer is: ' + answersList['$answer']);

    return answersList['$answer'];
  }

  bool checkAnswer() {
    if (_selectedAnswer == _questions![_currentQuestionIndex].correctAnswer) {
      print('true');
      _score += 10;
      notifyListeners();
      return true;
    } else {
      print('false');
      return false;
    }
  }

  void selectCategory(String category) {
    _categorySelected = category;
    notifyListeners();
  }
}
