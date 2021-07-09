import 'package:flutter/material.dart';

import '../providers/question_provider.dart';

class QuestionsCards extends StatelessWidget {
  const QuestionsCards({
    required this.questionsData,
  });

  final Questions questionsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          '${questionsData.questions![questionsData.currentQuestionIndex].question}'),
    );
  }
}
