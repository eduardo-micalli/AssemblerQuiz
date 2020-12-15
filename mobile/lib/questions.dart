import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/models/QuestionItem.dart';
import 'package:mobile/questionCard.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/result.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<QuestionItem> _questions;
  int questionNumber;
  int correctAnswer = 0;

  Future<List<QuestionItem>> _getQuestions() async {
    try {
      List<QuestionItem> questionList = List();
      final response =
          await http.get('https://2f233dfa94cb.ngrok.io/questions');
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson
            .forEach((item) => questionList.add(QuestionItem.fromJson(item)));
        return questionList;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void correctAnswerCount() {
    correctAnswer++;
  }

  @override
  void initState() {
    super.initState();
    _getQuestions().then((map) {
      _questions = map;
      _questions.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuestionItem>>(
        future: _getQuestions(),
        builder:
            (BuildContext context, AsyncSnapshot<List<QuestionItem>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: const ModalBarrier(
                      dismissible: false, color: Colors.grey),
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else {
            return cardContent(context);
          }
        });
  }

  //   child: LoadingIndicator(
  // // indicatorType: Indicator.circleStrokeSpin,
  Widget cardContent(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: Stack(
                  children: _questions
                      .map((i) => new QuestionCard(
                            questionNumber: _questions.indexOf(i),
                            item: i,
                            notifyParent: correctAnswerCount,
                          ))
                      .toList()),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.purple[800],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultPage(
                              correctAnswerCount:
                                  (correctAnswer != null) ? correctAnswer : 0);
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 140),
                    child: Text(
                      'Finish',
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
    );
  }
}
