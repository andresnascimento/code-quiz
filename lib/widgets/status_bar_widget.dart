import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/app_constants.dart';
import '../providers/question_provider.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({required this.questionsData});

  final Questions questionsData;

  @override
  Widget build(BuildContext context) {
    final questionsListLength = questionsData.questions!.length;
    final score = questionsData.score;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${questionsData.currentQuestionIndex + 1} / $questionsListLength',
                style: GoogleFonts.quicksand(textStyle: kHeaderSm),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8, 2, 24, 2),
                decoration: BoxDecoration(
                  color: kColorGray500,
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
                          image: ExactAssetImage('assets/images/coin.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '$score',
                      style: GoogleFonts.mulish(
                        textStyle:
                            kTextBody.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
                height: 24,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: questionsListLength,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 4,
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      width: (MediaQuery.of(context).size.width - 40) /
                          questionsListLength,
                      color: Colors.white.withAlpha(32),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: 24,
                child: ListView.builder(
                  //TODO fix the listview to occupy only the available space
                  scrollDirection: Axis.horizontal,
                  itemCount: questionsData.scoreKeeper.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 4,
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      width: (MediaQuery.of(context).size.width - 40) /
                          questionsListLength,
                      color: questionsData.scoreKeeper[index] == true
                          ? kColorSuccess
                          : kColorDanger,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
