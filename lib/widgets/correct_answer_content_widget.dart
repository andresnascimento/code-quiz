import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/question_provider.dart';
import '../models/app_constants.dart';

class CorrectAnswerContent extends StatelessWidget {
  const CorrectAnswerContent({
    required this.randomNumber,
    required this.questionsData,
    required this.correcAnswer,
  });

  final int randomNumber;
  final Questions questionsData;
  final String? correcAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 250.0,
          margin: EdgeInsets.only(bottom: 24.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/images/success-$randomNumber.gif'),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage('assets/images/coin.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  //TODO animate score
                  Text('${questionsData.score}',
                      style: GoogleFonts.quicksand(
                        textStyle: kHeaderMd.copyWith(
                            fontWeight: FontWeight.bold, color: kColorGold),
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
                '$correcAnswer',
                style: GoogleFonts.mulish(
                  textStyle: kTextBody.copyWith(color: kColorSuccess),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
