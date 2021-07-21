import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore == 0) {
      resultText = "What..? You got none of the questions correct... please revisit primary school maths!";
    } else if (resultScore == 1) {
      resultText = "Try harder, you got 1 out of 3 questions correct, try harder next time!";
    } else if (resultScore ==2) {
      resultText = "Almost there, you got 2 out of 3 questions correct, keep it up!";
    } else if (resultScore == 3) {
      resultText = "Congratulations! You got all questions correct!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // ignore: deprecated_member_use
          FlatButton(
              child: Text(
                "Restart Quiz",
              ),
              textColor: Colors.blue,
              onPressed: resetHandler)
        ],
      ),
    );
  }
}
