import 'package:flutter/material.dart';

import '../providers/question_provider.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({
    required this.questionsData,
  });

  final Questions questionsData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: questionsData
          .questions![questionsData.currentQuestionIndex].answers!
          .toJson()
          .length,
      itemBuilder: (context, index) {
        var value = questionsData
            .questions![questionsData.currentQuestionIndex].answers!
            .toJson();
        String? key = value.values.elementAt(index);
        String? selectedAnswer = value.keys.elementAt(index);
        return key != null
            ? InkWell(
                child: Text('$key'),
                onTap: () {
                  questionsData.setSelectedAnswer(selectedAnswer);
                  showModalBottomSheet(
                    // isDismissible: false,
                    context: context,
                    builder: (BuildContext ctx) {
                      return Container(
                          height: 300,
                          child: Column(
                            children: [
                              questionsData.checkAnswer()
                                  ? Text('CORRECT!')
                                  : Text('WRONG!'),

                              //TODO check if it's the last question
                              ElevatedButton(
                                onPressed: () {
                                  questionsData.nextQuestion();
                                  Navigator.pop(context);
                                },
                                child: Text('Next question'),
                              ),
                            ],
                          ));
                    },
                  );
                },
              )
            : Container();
      },
    );
  }
}
