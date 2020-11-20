import 'package:flutter/material.dart';

class ResultFieldBoard extends StatefulWidget {
  ResultFieldBoard({this.globalKey}) : super(key: globalKey);
  final GlobalKey<ResultFieldBoardState> globalKey;

  @override
  ResultFieldBoardState createState() => ResultFieldBoardState();
}

class ResultFieldBoardState extends State<ResultFieldBoard> {
  num _win;
  num _tie;

  @override
  void initState() {
    _win = 0;
    _tie = 0;
    super.initState();
  }

  void updateResult(num win, num tie) {
    setState(() {
      _win = win;
      _tie = tie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${_win.toStringAsFixed(1)}% win",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          "${_tie.toStringAsFixed(1)}% tie",
          style: TextStyle(
            color: Colors.yellow[300],
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
