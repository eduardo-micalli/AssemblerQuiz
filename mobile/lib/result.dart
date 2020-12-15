import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int correctAnswerCount;

  const ResultPage({this.correctAnswerCount});
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  double minProgress = 0;
  double maxProgress = 0.75;
  AnimationController _animationController;
  Animation<double> progressAnimation;
  double percent;

  @override
  void initState() {
    percent = widget.correctAnswerCount / 5;
    _animationController =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    progressAnimation =
        Tween(begin: minProgress, end: percent).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Card(
            elevation: 1,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    'Parabéns!',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'Você acertou ${widget.correctAnswerCount * 100 / 5} %',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) => progressBar(
                          context, widget, progressAnimation.value)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget progressBar(context, widget, value) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: SizedBox(
      height: 200.0,
      width: 200.0,
      child: CircularProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[800]),
        strokeWidth: 15.0,
        backgroundColor: Colors.blueGrey[100],
      ),
    ),
  );
}
