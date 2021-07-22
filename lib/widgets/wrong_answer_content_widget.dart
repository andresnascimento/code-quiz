import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/question_provider.dart';
import '../models/app_constants.dart';

class WrongAnswerContent extends StatelessWidget {
  const WrongAnswerContent(
      {required this.randomNumber,
      required this.questionsData,
      required this.correcAnswer,
      required this.selectedAnswer});

  final int randomNumber;
  final Questions questionsData;
  final String? correcAnswer;
  final String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 250.0,
          margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/images/wrong-$randomNumber.gif'),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Wrong answer!',
                  style: GoogleFonts.quicksand(
                    textStyle: kHeaderMd,
                  ),
                ),
              ),
              Container(
                height: 4.0,
                width: 40.0,
                color: kColorDanger,
              ),
              SizedBox(height: 16),
              Text(
                '$selectedAnswer',
                style: GoogleFonts.mulish(
                  textStyle: kTextBody.copyWith(color: kColorDanger),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'The correct answer is:',
                style: GoogleFonts.mulish(
                  textStyle: kTextBodySm.copyWith(color: kColorBlack),
                ),
              ),
              SizedBox(height: 16),
              Text(
                '$correcAnswer',
                style: GoogleFonts.mulish(
                  textStyle: kTextBody.copyWith(color: kColorSuccess),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
