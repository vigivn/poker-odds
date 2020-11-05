import 'package:flutter/material.dart';
import 'package:poker_odds/widgets/card_field_board.dart';

class PlayerDesk extends StatelessWidget {
  PlayerDesk({@required this.cardKey1, @required this.cardKey2});

  final GlobalKey<CardFieldBoardState> cardKey1;
  final GlobalKey<CardFieldBoardState> cardKey2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CardFieldBoard(globalKey: cardKey1),
          CardFieldBoard(globalKey: cardKey2),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                "80%",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Text(
                "20%",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
