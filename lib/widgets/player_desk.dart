import 'package:flutter/material.dart';
import 'package:poker_odds/core/calculator.dart';
import 'package:poker_odds/data/available_cards_data.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:poker_odds/widgets/card_field_board.dart';
import 'package:poker_odds/widgets/result_field_board.dart';
import 'package:provider/provider.dart';

class PlayerDesk extends StatelessWidget {
  PlayerDesk(
      {@required this.cardKey1,
      @required this.cardKey2,
      @required this.result});

  final GlobalKey<CardFieldBoardState> cardKey1;
  final GlobalKey<CardFieldBoardState> cardKey2;
  final GlobalKey<ResultFieldBoardState> result;

  void remove(BuildContext context) {
    if (cardKey1.currentState.name != "")
      context
          .read<AvailableCardsData>()
          .updateAvailable(cardKey1.currentState.name, true);
    if (cardKey2.currentState.name != "")
      context
          .read<AvailableCardsData>()
          .updateAvailable(cardKey2.currentState.name, true);
    context.read<CardFieldsData>().removePlayerDesk(this);
    Calculator().cardUpdated(context);
    context.read<CardFieldsData>().showCardSelector = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CardFieldBoard(globalKey: cardKey1),
          CardFieldBoard(globalKey: cardKey2),
          SizedBox(width: 20),
          ResultFieldBoard(globalKey: result),
        ],
      ),
    );
  }
}
