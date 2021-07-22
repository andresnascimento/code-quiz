import 'package:coding_quiz/models/app_constants.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  static String id = 'score_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlack,
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Your score is'),
            Text('90'),
            Text('Congratulations!'),
            Text(
                'You completed the game, but the fun is not over! You can always improve your score or try a new category 😎 '),
          ],
        ),
      ),
    );
  }
}
