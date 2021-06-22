import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/app_constants.dart';

class HomeScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippingClass(),
      child: Container(
        height: 320,
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 56, 24, 80),
          decoration: BoxDecoration(
            color: kColorPrimary,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 4.0,
                                color: kColorPrimaryDark,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image:
                                    ExactAssetImage('assets/images/avatar.png'),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Esther Howard',
                            style: GoogleFonts.mulish(textStyle: kTextBody),
                          ),
                        ],
                      ),
                    ),
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
                              image:
                                  ExactAssetImage('assets/images/trophy.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '93.4',
                          style: GoogleFonts.mulish(
                              textStyle: kTextBody.copyWith(
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100.0),
                      bottomLeft: Radius.circular(100.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Let\'s play!',
                      style: GoogleFonts.quicksand(textStyle: kHeaderLg),
                    ),
                    Text(
                      'Choose a category to start playing',
                      style: GoogleFonts.mulish(
                        textStyle: kTextBody.copyWith(
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//     child: ListView.builder(
//   itemCount: category.categoiesList.length,
//   itemBuilder: (context, index) {
//     return
//     ElevatedButton(
//       onPressed: () async {
//         questionsData.selectCategory(categoryList[index]);
//         await questionsData.fetchQuestions();
//         Navigator.of(context).pushNamed(QuizScreen.id);
//       },
//       child: Text('${categoryList[index]}'),
//     );
//   },
// )),

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
