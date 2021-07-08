import 'package:coding_quiz/models/question_model.dart';
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
  var questions;
  // var currentQuestion;

  @override
  void initState() {
    _isLoading = true;
    Provider.of<Questions>(context, listen: false).fetchQuestions().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<Questions>(context);

    // final currentQuestion =
    //     questionsData.questions![questionsData.currentQuestionIndex];

    // final currentAnwserList = currentQuestion.answers.toJson();

    return Scaffold(
      appBar: AppBar(
        title: Text('${questionsData.categorySelected}'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      print(questionsData
                          .questions![questionsData.currentQuestionIndex]
                          .answers!
                          .toJson());
                    },
                    child: Text('press'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '${questionsData.currentQuestionIndex + 1} / ${questionsData.questions!.length}',
                      ),
                      Container(
                        child: Text('20.0'),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                        '${questionsData.questions![questionsData.currentQuestionIndex].question}'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: questionsData
                        .questions![questionsData.currentQuestionIndex].answers!
                        .toJson()
                        .length,
                    itemBuilder: (context, index) {
                      var value = questionsData
                          .questions![questionsData.currentQuestionIndex]
                          .answers!
                          .toJson();
                      String? key = value.values.elementAt(index);
                      return key != null ? Text('${key}') : Container();
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
