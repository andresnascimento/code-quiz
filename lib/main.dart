import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // home: HomePage(),
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) => HomePage(),
          QuizScreen.id: (context) => QuizScreen(),
          ScoreScreen.id: (context) => ScoreScreen(),
        },
      ),
    );
  }
}
