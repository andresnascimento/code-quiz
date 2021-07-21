import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import '../models/app_constants.dart';
import '../providers/question_provider.dart';
import '/widgets/wrong_answer_content_widget.dart';
import 'correct_answer_content_widget.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({
    required this.questionsData,
  });

  final Questions questionsData;

  //TODO refactor to improve readability

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
            ? GestureDetector(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  transform: Matrix4.translationValues(0.0, -46.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: kColorPrimaryDark,
                  ),
                  child: Text(
                    '$key',
                    style: GoogleFonts.mulish(textStyle: kTextBody),
                  ),
                ),
                onTap: () {
                  questionsData.setSelectedAnswer(selectedAnswer);

                  var isLastQuestion = questionsData.currentQuestionIndex >=
                      (questionsData.questions!.length - 1);
                  var randomNumber = Random().nextInt(4);

                  var isCorrectAnswer = questionsData.checkAnswer();
                  var correcAnswer = questionsData.correctAnswer();

                  showModalBottomSheet(
                    backgroundColor: Color.fromARGB(0, 255, 255, 255),
                    isDismissible: false,
                    context: context,
                    builder: (BuildContext ctx) {
                      return Container(
                        padding: EdgeInsets.only(top: 24.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: isCorrectAnswer
                                    ? CorrectAnswerContent(
                                        randomNumber: randomNumber,
                                        questionsData: questionsData,
                                        correcAnswer: correcAnswer,
                                      )
                                    : WrongAnswerContent(
                                        randomNumber: randomNumber,
                                        questionsData: questionsData,
                                        correcAnswer: correcAnswer,
                                        selectedAnswer: key,
                                      ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    if (!isLastQuestion) {
                                      questionsData.nextQuestion();
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: isLastQuestion
                                      ? Container(
                                          color: kColorGold,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'See score',
                                                style: GoogleFonts.quicksand(
                                                  textStyle: kHeaderSm,
                                                ),
                                              ),
                                              // SizedBox(width: 10.0),
                                              // Icon(
                                              //   Icons.school,
                                              //   color: Colors.white,
                                              // )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          color: kColorPrimary,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Next question',
                                                style: GoogleFonts.mulish(
                                                  textStyle: kTextBody,
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              Icon(
                                                Icons.east,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            : Container();
      },
    );
  }
}
