import 'package:flutter/material.dart';
import 'package:myapp/screens/result.dart';

import 'models/quiz.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool isSwitched = false;

class _HomeState extends State<Home> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    print('Answer Chosen!');
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'Q1. Flutter is a ?',
      'answers': [
        {'text': 'Programming Language', 'score': 0},
        {'text': 'SDK', 'score': 10},
        {'text': 'Both', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ]
    },
    {
      'questionText':
          'Q2. A notable feature of the Dart platform is it doesnt support for hot reload ?',
      'answers': [
        {'text': 'False', 'score': 10},
        {'text': 'True', 'score': 0},
      ]
    },
    {
      'questionText':
          'Q3. Flutter is an __________ mobile application development framework created by Google?',
      'answers': [
        {'text': 'Open-source', 'score': 10},
        {'text': 'Shareware', 'score': 0},
        {'text': 'Both', 'score': 0},
        {'text': 'None of the above', 'score': 0},
      ]
    },
    {
      'questionText':
          'Q4. Flutter apps are written in the ____ language and make use of many of the languages more advanced features?',
      'answers': [
        {'text': 'C', 'score': 0},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': 0},
        {'text': 'Swift', 'score': 0},
      ]
    },
    {
      'questionText': 'Q5. What are the advantages of Flutter?',
      'answers': [
        {'text': 'Cross-platform Development', 'score': 0},
        {'text': 'Faster Development', 'score': 0},
        {'text': 'UI Focused', 'score': 0},
        {'text': 'All of the above', 'score': 10},
      ]
    },
    {
      'questionText': 'Q6. Flutter is developed by Facebook?',
      'answers': [
        {'text': 'True', 'score': 0},
        {'text': 'False', 'score': 10},
      ]
    },
    {
      'questionText': 'Q7. Which of the following widgets use for layout ?',
      'answers': [
        {'text': 'Text', 'score': 0},
        {'text': 'Column', 'score': 10},
        {'text': 'Expanded', 'score': 0},
        {'text': 'Inkwell', 'score': 0},
      ]
    },
    {
      'questionText': 'Q8. Flutter use platform primitives ?',
      'answers': [
        {'text': 'True', 'score': 0},
        {'text': 'False', 'score': 10},
      ]
    },
    {
      'questionText': 'Q9. Flutter uses one code base ?',
      'answers': [
        {'text': 'True', 'score': 10},
        {'text': 'False', 'score': 0},
      ]
    },
    {
      'questionText':
          'Q10. Which of the following widgets used for repeating the content ?',
      'answers': [
        {'text': 'Expanded', 'score': 0},
        {'text': 'ListView', 'score': 10},
        {'text': 'Stack', 'score': 0},
        {'text': 'Scaffold', 'score': 0},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Quiz App',
            style: TextStyle(
                color: isSwitched == false ? Colors.white : Colors.black,
                fontFamily: "Lobster",
                fontSize: 30),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: isSwitched == false ? Colors.white : Colors.black,
          child: _questionIndex < _question.length
              ? Quiz(_question, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
      ),
    );
  }
}
