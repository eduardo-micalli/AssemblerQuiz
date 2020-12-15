import 'package:flutter/material.dart';
import 'package:mobile/questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Assembler Quiz',
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xF9F9F9),
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 1.0,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        width: 240,
                        height: 240,
                        margin: EdgeInsets.fromLTRB(5, 100, 0, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Colors.blueGrey[100]),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                        child: Text(
                          'Assembler Quiz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 50),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return QuestionPage();
                            },
                          ),
                        );
                      },
                      color: Colors.purple[800],
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 120),
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
