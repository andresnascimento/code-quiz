import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/app_constants.dart';
import '../widgets/status_bar_widget.dart';
import '../widgets/answers_list_widget.dart';
import '../widgets/questions_cards_widget.dart';
import '../providers/question_provider.dart';

class QuizScreen extends StatefulWidget {
  static String id = 'quiz_screen';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Provider.of<Questions>(context, listen: false).fetchQuestions().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<Questions>(context);

    return Scaffold(
      backgroundColor: kColorBlack,
      //TODO add a confirmation before leaving quiz's screen
      appBar: AppBar(
        title: Text(
          '${questionsData.categorySelected}',
          style: GoogleFonts.quicksand(textStyle: kHeaderSm),
        ),
        elevation: 0,
        backgroundColor: kColorBlack,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  StatusBar(questionsData: questionsData),
                  SizedBox(height: 70),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: kColorPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        QuestionsCards(questionsData: questionsData),
                        AnswersList(questionsData: questionsData),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
