import 'package:coding_quiz/models/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/question_provider.dart';

class QuestionsCards extends StatelessWidget {
  const QuestionsCards({
    required this.questionsData,
  });

  final Questions questionsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -70.0, 0.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                height: 225,
                width: (MediaQuery.of(context).size.width - 80),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: kColorBlack.withAlpha(60),
                      blurRadius: 24,
                      offset: Offset(0, 12),
                    )
                  ],
                ),
                child: null),
          ),
          Container(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                height: 215,
                width: (MediaQuery.of(context).size.width - 60),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: kColorBlack.withAlpha(60),
                      blurRadius: 24,
                      offset: Offset(0, 12),
                    )
                  ],
                ),
                child: null),
          ),
          Container(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
              height: 205,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: kColorBlack.withAlpha(60),
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${questionsData.questions![questionsData.currentQuestionIndex].question}',
                    style: GoogleFonts.quicksand(textStyle: kHeaderXs),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
