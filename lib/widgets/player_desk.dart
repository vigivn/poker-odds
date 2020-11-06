import 'package:flutter/material.dart';
import 'package:poker_odds/data/available_cards_data.dart';
import 'package:poker_odds/widgets/card_field_board.dart';
import 'package:provider/provider.dart';

class PlayerDesk extends StatelessWidget {
  PlayerDesk(
      {@required this.cardKey1,
      @required this.cardKey2,
      @required this.remove});

  final GlobalKey<CardFieldBoardState> cardKey1;
  final GlobalKey<CardFieldBoardState> cardKey2;
  final Function remove;

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
            onPressed: () {
              if (cardKey1.currentState.name != "")
                context
                    .read<AvailableCardsData>()
                    .updateAvailable(cardKey1.currentState.name, true);
              if (cardKey2.currentState.name != "")
                context
                    .read<AvailableCardsData>()
                    .updateAvailable(cardKey2.currentState.name, true);
              remove(this);
            },
          ),
        ],
      ),
    );
  }
}
