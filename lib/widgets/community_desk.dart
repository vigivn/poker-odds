import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:poker_odds/widgets/card_field_board.dart';
import 'package:provider/provider.dart';

class CommunityDesk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardKeys = context.watch<Data>().communityDeskKeys;
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CardFieldBoard(globalKey: cardKeys[0]),
        CardFieldBoard(globalKey: cardKeys[1]),
        CardFieldBoard(globalKey: cardKeys[2]),
        CardFieldBoard(globalKey: cardKeys[3]),
        CardFieldBoard(globalKey: cardKeys[4]),
      ],
    ));
  }
}
