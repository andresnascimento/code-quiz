import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';

class QuizScreen extends StatefulWidget {
  static String id = 'quiz_screen';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

//TODO fix the error when the screen loads

class _QuizScreenState extends State<QuizScreen> {
  var _isLoading = false;

  @override
  void initState() {
    _isLoading = true;

    Provider.of<Questions>(context, listen: false).fetchQuestions().then((_) {
      setState(() {
        // shows and hides the loading
        _isLoading = false;
      });
    });
    super.initState();
  }

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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
