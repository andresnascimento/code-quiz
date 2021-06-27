import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/app_constants.dart';

class HomeScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippingClass(),
      child: Container(
        height: 380,
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 100, 24, 80),
          decoration: BoxDecoration(
            color: kColorPrimary,
          ),
          child: Column(
            children: <Widget>[
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
                    SizedBox(height: 8.0),
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
