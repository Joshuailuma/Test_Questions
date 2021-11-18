import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_questions/components/quiz_logic.dart';
import 'package:test_questions/screens/home_screen.dart';

QuizLogic quizLogic = QuizLogic();
String questionNumber = '1';
String questionLength = quizLogic.getQuestionLength().toString();
String finalScore = '1';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void closeFunction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizLogic.getCorrectAnswer();

    setState(() {
      if (quizLogic.isFinished() == true) {
        Alert(
          closeIcon: Icon(
            Icons.highlight_remove,
          ),
          context: context,
          style: const AlertStyle(titleTextAlign: TextAlign.center),
          type: AlertType.success,
          title: "You got $finalScore out of $questionLength",
          desc: "You have come to the end of the quiz",
          buttons: [
            DialogButton(
              child: Text(
                'Close',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ).show();

        quizLogic.reset();
      } else if (userPickedAnswer == correctAnswer) {
        totalScore = score++;
        print(totalScore);
        finalScore = totalScore.toString();
      }
      quizLogic.getNextQuestion();
      quizLogic.increaseQuestionNumber();
      questionNumber = quizLogic.getQuestionNumber().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: Text(
                'Question $questionNumber of $questionLength',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.3,
                ),
              ),
            ),

            // SizedBox(height: 25.0,),

            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: SweepGradient(
                    colors: [
                      Colors.blue,
                      Colors.deepOrange,
                      Colors.teal,
                      Colors.indigo,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(quizLogic.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          // fontWeight: FontWeight.w400,
                          // letterSpacing: 1.0,
                          wordSpacing: 1.8,
                          color: Colors.amberAccent,
                        )),
                  ),
                ),
              ),
            ),

            Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      primary: Colors.white,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ))),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  primary: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
