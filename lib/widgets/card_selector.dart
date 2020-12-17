import 'package:flutter/material.dart';
import 'package:poker_odds/models/card_selector_model.dart';
import 'package:poker_odds/widgets/card_field_selector.dart';
import 'package:provider/provider.dart';

class CardSelector extends StatelessWidget {
  CardSelector(this._index);
  final int _index;

  String _indexToType(int index) {
    switch (index) {
      case 0:
        return "C";
      case 1:
        return "D";
      case 2:
        return "H";
      case 3:
        return "S";
      default:
        return "C";
    }
  }

  Column _getCards(BuildContext context, String type) {
    assert(type == "C" || type == "D" || type == "H" || type == "S");
    final available = context.watch<CardSelectorModel>().availableCards;
    return Column(
      children: [
        Row(
          children: [
            CardFieldSelector(name: "2$type", clickable: available["2$type"]),
            CardFieldSelector(name: "3$type", clickable: available["3$type"]),
            CardFieldSelector(name: "4$type", clickable: available["4$type"]),
            CardFieldSelector(name: "5$type", clickable: available["5$type"]),
            CardFieldSelector(name: "6$type", clickable: available["6$type"]),
            CardFieldSelector(name: "7$type", clickable: available["7$type"]),
            CardFieldSelector(name: "8$type", clickable: available["8$type"]),
          ],
        ),
        Row(
          children: [
            CardFieldSelector(name: "9$type", clickable: available["9$type"]),
            CardFieldSelector(name: "10$type", clickable: available["10$type"]),
            CardFieldSelector(name: "J$type", clickable: available["J$type"]),
            CardFieldSelector(name: "Q$type", clickable: available["Q$type"]),
            CardFieldSelector(name: "K$type", clickable: available["K$type"]),
            CardFieldSelector(name: "A$type", clickable: available["A$type"]),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Theme.of(context).primaryColor,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        height: MediaQuery.of(context).size.width / 7 / 691 * 1056 * 2,
        child: _getCards(context, _indexToType(_index)));
  }
}
