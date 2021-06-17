import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';

class QuizScreen extends StatelessWidget {
  static String id = 'quiz_screen';
  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<Questions>(context);

    final currentQuestion =
        questionsData.questions[questionsData.currentQuestionIndex];

    final currentAnwserList = currentQuestion.answers.toJson();

    return Scaffold(
      appBar: AppBar(
        title: Text(questionsData.categorySelected),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Text('${currentQuestion.question}'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentAnwserList.length,
              itemBuilder: (context, index) {
                String key = currentAnwserList.keys.elementAt(index);
                if (currentAnwserList[key] != null) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Text('${currentAnwserList[key]}'),
                    ),
                  );
                } else {
                  return null;
                }
              },
            ),
            questionsData.isDone
                ? ElevatedButton(
                    onPressed: () {
                      // questionsData.nextQuestion();
                    },
                    child: Text('Finish'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      questionsData.nextQuestion();
                    },
                    child: Text('Next Question'),
                  )
          ],
        ),
      ),
    );
  }
}
