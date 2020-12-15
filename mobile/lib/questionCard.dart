import 'package:flutter/material.dart';
import 'package:mobile/models/QuestionItem.dart';

class QuestionCard extends StatefulWidget {
  final int questionNumber;
  final QuestionItem item;
  final Function() notifyParent;

  QuestionCard({this.questionNumber, this.item, @required this.notifyParent});

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int correctAnswerCount = 0;
  bool _isVisible = true;

  void changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 4.0,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              height: 525,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: 100,
                    child: Text(
                      'Where ${this.widget.item.assemblerName} is from?',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Column(
                      children: this
                          .widget
                          .item
                          .answers
                          .map(
                            (i) => new GestureDetector(
                                onTap: () => {
                                      if (this.widget.item.answers.indexOf(i) +
                                              1 ==
                                          this.widget.item.correctAnswer)
                                        {widget.notifyParent()},
                                      changeVisibility()
                                    },
                                child: Container(
                                  height: 80,
                                  width: 170,
                                  child: Text(i),
                                )),
                          )
                          .toList())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
