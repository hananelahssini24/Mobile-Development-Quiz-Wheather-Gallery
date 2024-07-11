import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;
  final quiz = [
    {
      'title': 'Question 1',
      'answers': [
        {'answer': 'Answer 11', 'correct': false},
        {'answer': 'Answer 12', 'correct': false},
        {'answer': 'Answer 13', 'correct': true},
      ]
    },
    {
      'title': 'Question 2',
      'answers': [
        {'answer': 'Answer 21', 'correct': false},
        {'answer': 'Answer 22', 'correct': true},
        {'answer': 'Answer 23', 'correct': false},
      ]
    },
  ];

  void answerQuestion(bool correct) {
    if (correct) {
      score++;
    }
    setState(() {
      if (currentQuestion < quiz.length - 1) {
        currentQuestion++;
      } else {
        // Quiz is complete
        // You can handle the quiz completion here
        // For example, navigate to a results page
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.orange,
      ),
      body: (this.currentQuestion >= quiz.length)
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text('Score : ${(score / quiz.length * 100).round()} %',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent, fontSize: 22)),
                  MaterialButton(
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
                        });
                      },
                      child: Text(
                        'Restart ...',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ))
                ]))
          : ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      'Question : ${currentQuestion + 1}/${quiz.length}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    '${quiz[currentQuestion]['title']} ?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                ...(quiz[currentQuestion]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return ListTile(
                    title: MaterialButton(
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (answer['correct'] == true) ++score;
                          ++currentQuestion;
                        });
                      },
                      child: Text(
                        answer['answer'] as String,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
    );
  }
}
