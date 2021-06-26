import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/app_constants.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 0),
      color: kColorPrimary,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6.0,
                        color: kColorPrimaryDark,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage('assets/images/avatar.png'),
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
                      image: ExactAssetImage('assets/images/trophy.png'),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '93.4',
                  style: GoogleFonts.mulish(
                      textStyle:
                          kTextBody.copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
