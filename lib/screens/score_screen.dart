import 'package:coding_quiz/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/models/app_constants.dart';
import '/providers/question_provider.dart';

//TODO add logic to send data to firebase

class ScoreScreen extends StatelessWidget {
  static String id = 'score_screen';

  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<Questions>(context);
    final score = questionsData.score;
    final numbOfQuestions = questionsData.numbOfQuestions;
    final rightAnswers =
        questionsData.scoreKeeper.where((element) => element == true).length;
    double scorePercentage = (rightAnswers / numbOfQuestions);
    return Scaffold(
      backgroundColor: kColorBlack,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 48.0),
        child: Column(
          children: <Widget>[
            Expanded(child: Image.asset('assets/images/score-trophy.png')),
            Text(
              'Your score is',
              style: kTextBody,
            ),
            Text(
              '$score',
              style: GoogleFonts.quicksand(textStyle: kHeaderLg)
                  .copyWith(fontSize: 64.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Congratulations!',
              style: GoogleFonts.quicksand(textStyle: kHeaderMd)
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'You completed the game, but the fun is not over! You can always improve your score or try a new category 😎 ',
              style: kTextBody,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'you got $rightAnswers questions right',
                  style: kTextBodySm,
                ),
                Text(
                  '${(scorePercentage * 100).toStringAsFixed(1)}%',
                  style: kTextBodySm.copyWith(color: Colors.white60),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Stack(
              children: <Widget>[
                Container(
                  height: 4.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: kColorGray500,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                Container(
                  height: 4.0,
                  width: MediaQuery.of(context).size.width * scorePercentage,
                  decoration: BoxDecoration(
                    color: kColorSuccess,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                )
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      questionsData.resetQuiz();
                      questionsData.fetchQuestions();
                      Navigator.of(context).pushNamed(QuizScreen.id);
                    },
                    child: Text(
                      'Play again',
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: kColorPrimary,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Continue',
                        style: kTextBodySm.copyWith(color: kColorBlack)),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: kColorSuccess,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
