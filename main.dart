import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;

  final List<Map<String, Object>> _questions = [
    {'question': 'Flutter is developed by Facebook.', 'answer': false},
    {'question': 'Dart is used to build Flutter apps.', 'answer': true},
    {'question': 'Flutter is only for Android development.', 'answer': false},
  ];

  void _answerQuestion(bool userAnswer) {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
      } else {
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Quiz Completed!"),
        content: Text("You have answered all the questions."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _questionIndex = 0; // Restart Quiz
              });
            },
            child: Text("Restart"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: _questionIndex < _questions.length
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _questions[_questionIndex]['question'] as String,
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _answerQuestion(true),
              child: Text('True'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _answerQuestion(false),
              child: Text('False'),
            ),
          ],
        )
            : Text(
          "Quiz Completed!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
