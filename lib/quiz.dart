import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({this.questions, this.questionIndex, this.answerQuestion});

  List _getAnswersListAsWidget(answers) => answers
      .map((item) => Answer(() => answerQuestion(item['score']), item['text']))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.unmodifiable(() sync* {
          yield Question(questions[questionIndex]['question']);
          yield* _getAnswersListAsWidget(questions[questionIndex]['answers']);
        }()),
      ),
    );
  }
}
