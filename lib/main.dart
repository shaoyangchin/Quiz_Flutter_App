import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());

// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "13 + 4 = ?",
      "answers": [
        {"text": "17", "score": 1},
        {"text": "18", "score": 0},
        {"text": "15", "score": 0},
        {"text": "16", "score": 0},
      ],
    },
    {
      "questionText": "20/2 - 10 = ?",
      "answers": [
        {"text": "10", "score": 0},
        {"text": "0", "score": 1},
        {"text": "5", "score": 0},
        {"text": "20", "score": 0},
      ],
    },
    {
      "questionText": "100 * 1 + 2 * 10",
      "answers": [
        {"text": "3000", "score": 0},
        {"text": "110", "score": 0},
        {"text": "120", "score": 1},
        {"text": "100", "score": 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
