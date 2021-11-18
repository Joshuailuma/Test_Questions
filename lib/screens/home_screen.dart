import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_questions/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.green,
              title: Text('General Quiz')),
          body: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'images/man.jpg',
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient:
                            SweepGradient(colors: [Colors.green, Colors.blue]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: Card(
                            elevation: 15.0,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 8.0),
                              child: Text(
                                'Take a Quiz',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.3,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
