import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(BasicFlutterApp());

class BasicFlutterApp extends StatefulWidget {
  @override
  _BasicFlutterAppState createState() => _BasicFlutterAppState();
}

class _BasicFlutterAppState extends State<BasicFlutterApp> {
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 2},
        {'text': 'Red', 'score': 4},
        {'text': 'Green', 'score': 6},
        {'text': 'Blue', 'score': 8},
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 4},
        {'text': 'Lion', 'score': 6},
        {'text': 'Snake', 'score': 8},
      ],
    },
    {
      'question': 'What\'s your favorite football team?',
      'answers': [
        {'text': 'Flamengo', 'score': 2},
        {'text': 'Botafogo', 'score': 4},
        {'text': 'Fluminense', 'score': 6},
        {'text': 'Vasco', 'score': 8},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
        _totalScore += score;
      });
    }
  }

  void _handleRestartQuestions() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.red,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(
                handleRestartQuestions: _handleRestartQuestions,
                resultScore: _totalScore),
      ),
    );
  }
}
