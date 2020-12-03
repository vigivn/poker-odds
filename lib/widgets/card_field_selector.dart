import 'package:flutter/material.dart';
import 'package:poker_odds/core/calculator.dart';
import 'package:poker_odds/data/available_cards_data.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:provider/provider.dart';

class CardFieldSelector extends StatelessWidget {
  CardFieldSelector({@required this.name, @required this.clickable});

  final String name;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: clickable ? null : Colors.grey,
        child: InkWell(
          child: Container(
            padding:
                clickable ? const EdgeInsets.symmetric(horizontal: 2) : null,
            child: clickable ? Image.asset('assets/images/$name.png') : null,
          ),
          onTap: () {
            if (clickable) {
              context
                  .read<CardFieldsData>()
                  .selectedFieldKey
                  .currentState
                  .updateName(name);
              context.read<CardFieldsData>().selectedField = null;
              context.read<AvailableCardsData>().updateAvailable(name, false);
              context.read<CardFieldsData>().showCardSelector = false;
              Calculator().cardUpdated(context);
            }
          },
        ),
      ),
      width: MediaQuery.of(context).size.width / 7,
      height: MediaQuery.of(context).size.width / 7 / 690 * 1036,
    );
  }
}
