import 'package:coding_quiz/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './providers/category_provider.dart';
import './providers/question_provider.dart';
import 'screens/score_screen.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Questions(),
        ),
        ChangeNotifierProvider(
          create: (context) => Category(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: AuthScreen.id,
        routes: {
          HomePage.id: (context) => HomePage(),
          QuizScreen.id: (context) => QuizScreen(),
          ScoreScreen.id: (context) => ScoreScreen(),
          AuthScreen.id: (context) => AuthScreen(),
        },
      ),
    );
  }
}
