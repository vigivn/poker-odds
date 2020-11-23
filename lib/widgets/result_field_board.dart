import 'package:flutter/material.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:provider/provider.dart';

class ResultFieldBoard extends StatefulWidget {
  ResultFieldBoard({this.globalKey}) : super(key: globalKey);
  final GlobalKey<ResultFieldBoardState> globalKey;

  @override
  ResultFieldBoardState createState() => ResultFieldBoardState();
}

class ResultFieldBoardState extends State<ResultFieldBoard> {
  num _equ;
  num _win;
  num _tie;

  @override
  void initState() {
    _equ = 0;
    _win = 0;
    _tie = 0;
    super.initState();
  }

  void updateResult(num equ, num win, num tie) {
    setState(() {
      _equ = equ;
      _win = win;
      _tie = tie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_equ.toStringAsFixed(1)}% equ",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        Text(
          "${_win.toStringAsFixed(1)}% win",
          style: TextStyle(
            color: Colors.green[200],
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(
          "${_tie.toStringAsFixed(1)}% tie",
          style: TextStyle(
            color: Colors.yellow[300],
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
