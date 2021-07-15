import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import '../models/app_constants.dart';
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
                  Random random = new Random();
                  int randomNumber = random.nextInt(4);
                  showModalBottomSheet(
                    backgroundColor: Color.fromARGB(0, 255, 255, 255),
                    // isDismissible: false,
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
                            // questionsData.checkAnswer()
                            //     ? Text('CORRECT!')
                            //     : Text('WRONG!'),
                            //TODO extract to widget
                            // CORRECT:
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 120.0,
                                  width: 250.0,
                                  margin: EdgeInsets.only(bottom: 24.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: ExactAssetImage(
                                          'assets/images/success-$randomNumber.gif'),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 0.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: ExactAssetImage(
                                                  'assets/images/coin.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        //TODO animate score
                                        //TODO add score logic
                                        Text('+ 93.4',
                                            style: GoogleFonts.quicksand(
                                              textStyle: kHeaderMd.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: kColorGold),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 24.0),
                                      child: Text(
                                        'Right answer!',
                                        style: GoogleFonts.quicksand(
                                          textStyle: kHeaderMd,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 4.0,
                                      width: 40.0,
                                      color: kColorSuccess,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      '$key',
                                      style: GoogleFonts.mulish(
                                        textStyle: kTextBody.copyWith(
                                            color: kColorSuccess),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //TODO check if it's the last question
                            Expanded(
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    questionsData.nextQuestion();
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    color: kColorPrimary,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
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
