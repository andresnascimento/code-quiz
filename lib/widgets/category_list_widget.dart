import 'package:coding_quiz/providers/question_provider.dart';
import 'package:coding_quiz/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../models/app_constants.dart';

class CategoryCard extends StatelessWidget {
  final Color categoryColor;
  final Color gradientLight;
  final Color gradientDark;
  final Color categoryShadow;
  final String categoryName;
  final Color fontColor;
  final String imageName;

  CategoryCard({
    required this.categoryColor,
    required this.gradientDark,
    required this.gradientLight,
    required this.categoryShadow,
    required this.categoryName,
    this.fontColor = Colors.white,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<Questions>(context);
    double widthContainer = MediaQuery.of(context).size.width - 48;
    return GestureDetector(
      onTap: () {
        questionsData.selectCategory(categoryName);
        // questionsData.fetchQuestions();
        Navigator.of(context).pushNamed(QuizScreen.id);
      },
      child: Container(
        height: 130,
        clipBehavior: Clip.hardEdge,
        width: widthContainer,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(24.0),
            bottomLeft: Radius.circular(24.0),
            bottomRight: Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: categoryShadow,
              blurRadius: 32,
              offset: Offset(0, 16),
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Positioned(
                      left: -115,
                      bottom: -60,
                      child: Transform.rotate(
                        angle: -95,
                        child: Container(
                          height: 130,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                gradientLight,
                                gradientDark,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image:
                              ExactAssetImage('assets/images/$imageName.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            categoryName,
                            style: GoogleFonts.mulish(textStyle: kTextBody)
                                .copyWith(color: fontColor),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: gradientDark,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            '12 Apr',
                            style: GoogleFonts.mulish(textStyle: kTextBodySm)
                                .copyWith(color: fontColor),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '0.0',
                          style: GoogleFonts.quicksand(textStyle: kHeaderLg)
                              .copyWith(color: fontColor),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
                          decoration: BoxDecoration(),
                          child: Text(
                            'Score',
                            style: GoogleFonts.mulish(
                              textStyle: kTextBody.copyWith(
                                color: fontColor.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
