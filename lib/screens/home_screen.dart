import 'package:coding_quiz/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/categories_model.dart';
import '../providers/question_provider.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_screen';
  final Category category = Category();
  final categoryList = Category().categoiesList;

  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<Questions>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: category.categoiesList.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () async {
              questionsData.selectCategory(categoryList[index]);
              await questionsData.fetchQuestions();
              Navigator.of(context).pushNamed(QuizScreen.id);
            },
            child: Text('${categoryList[index]}'),
          );
        },
      )),
    );
  }
}
