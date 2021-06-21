import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/app_constants.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 112, 62, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(24.0),
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(8.0),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(159, 48, 5, 0.5),
                    blurRadius: 32,
                    offset: Offset(0, 16))
              ]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: ExactAssetImage('assets/images/html.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'HTML Quiz',
                            style: GoogleFonts.mulish(textStyle: kTextBody),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(222, 92, 43, 1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            '12 Apr',
                            style: GoogleFonts.mulish(textStyle: kTextBodySm),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('0.0',
                            style: GoogleFonts.quicksand(textStyle: kHeaderLg)),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
                          child: Text(
                            'Score',
                            style: GoogleFonts.mulish(
                              textStyle: kTextBody.copyWith(
                                  color: Color.fromRGBO(255, 255, 255, 0.6),
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
