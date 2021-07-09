import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/app_constants.dart';
import '../providers/question_provider.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({required this.questionsData});

  final Questions questionsData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          '${questionsData.currentQuestionIndex + 1} / ${questionsData.questions!.length}',
          style: GoogleFonts.quicksand(textStyle: kHeaderSm),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(8, 2, 24, 2),
          decoration: BoxDecoration(
            color: kColorPrimaryDark,
            borderRadius: BorderRadius.circular(60.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage('assets/images/trophy.png'),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                '93.4',
                style: GoogleFonts.mulish(
                  textStyle: kTextBody.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
