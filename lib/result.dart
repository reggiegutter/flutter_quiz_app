import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function handleRestartQuestions;
  final int resultScore;

  Result({this.handleRestartQuestions, this.resultScore});

  String get resultText {
    if (resultScore <= 8) {
      return 'You are awesome!!!';
    } else if (resultScore <= 12) {
      return 'You are nice!';
    } else if (resultScore <= 16) {
      return 'You are... strange?!';
    } else {
      return 'You are... WTF?!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                resultText,
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 5),
            ),
            Container(
              child: Text(
                'Total Score: $resultScore',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16),
            ),
            RaisedButton(
              child: Text(
                'Restart',
              ),
              onPressed: handleRestartQuestions,
            )
          ],
        ),
      ),
    );
  }
}
