import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handleAnswerSelection;
  final String answerText;

  Answer(this.handleAnswerSelection, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 40, right: 40),
      child: RaisedButton(
        child: Text(answerText),
        onPressed: handleAnswerSelection,
      ),
    );
  }
}
