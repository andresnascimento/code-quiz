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
                return TextButton(
                  onPressed: () {},
                  child: Text('${currentAnwserList[key]}'),
                  //TODO check if the answer is null and remove it from the list
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                questionsData.nextQuestion();
                //TODO check if is finished
              },
              child: Text('Next Question'),
            )
          ],
        ),
      ),
    );
  }
}
