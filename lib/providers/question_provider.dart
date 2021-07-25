import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/question_model.dart';

class Questions with ChangeNotifier {
  List<Question>? _questions;
  List<Question>? get questions {
    if (_questions != null) return [..._questions!];
  }

  var _numbOfQuestions = 2;
  int get numbOfQuestions {
    return _numbOfQuestions;
  }

  var isDone = false;

  String? _categorySelected;
  String? get categorySelected {
    return _categorySelected;
  }

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex {
    return _currentQuestionIndex;
  }

  String? _selectedAnswer;
  String? get selectedAnswer {
    return _selectedAnswer;
  }

  int _score = 0;
  int get score {
    return _score;
  }

  List<bool> _scoreKeeper = [];
  List<bool> get scoreKeeper {
    return _scoreKeeper;
  }

  Future<void> fetchQuestions() async {
    String apiKey = 'rRugdBWczdMjHKjQR0Z8DnqpjmXyn3Q8Vh6H47ja';
    final url = Uri.parse(
        'https://quizapi.io/api/v1/questions?apiKey=$apiKey&limit=$_numbOfQuestions&tags=$_categorySelected');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _questions = quizFromJson(response.body);
        notifyListeners();

        print(response.statusCode);
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      throw error;
      //TODO add the error message on the screen
    }
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
      _scoreKeeper.add(true);
      notifyListeners();
      return true;
    } else {
      print('false');
      _scoreKeeper.add(false);
      notifyListeners();
      return false;
    }
  }

  void selectCategory(String category) {
    _categorySelected = category;
    notifyListeners();
  }

  void resetQuiz() {
    _scoreKeeper = [];
    _score = 0;
    _currentQuestionIndex = 0;
    notifyListeners();
  }

  Future<void> saveCatgoryScore() async {
    final url = Uri.parse(
        'https://conding-quiz-default-rtdb.firebaseio.com/categories.json');

    try {
      final response = await http.post(url,
          body: jsonEncode({
            'category': _categorySelected,
            'score': _score,
            'date': DateTime.now().toString(),
          }));

      //TODO add a new category object within a category provider
      print(response.body);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
