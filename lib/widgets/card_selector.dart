import 'package:flutter/material.dart';
import 'package:poker_odds/data/available_cards_data.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:poker_odds/widgets/card_field_selector.dart';
import 'package:provider/provider.dart';

class CardSelector extends StatelessWidget {
  Column _cardsC(BuildContext context) {
    final available = context.watch<AvailableCardsData>().availableCards;
    return Column(
      children: [
        Row(
          children: [
            CardFieldSelector(name: "2C", clickable: available["2C"]),
            CardFieldSelector(name: "3C", clickable: available["3C"]),
            CardFieldSelector(name: "4C", clickable: available["4C"]),
            CardFieldSelector(name: "5C", clickable: available["5C"]),
            CardFieldSelector(name: "6C", clickable: available["6C"]),
            CardFieldSelector(name: "7C", clickable: available["7C"]),
            CardFieldSelector(name: "8C", clickable: available["8C"]),
          ],
        ),
        Row(
          children: [
            CardFieldSelector(name: "9C", clickable: available["9C"]),
            CardFieldSelector(name: "10C", clickable: available["10C"]),
            CardFieldSelector(name: "JC", clickable: available["JC"]),
            CardFieldSelector(name: "QC", clickable: available["QC"]),
            CardFieldSelector(name: "KC", clickable: available["KC"]),
            CardFieldSelector(name: "AC", clickable: available["AC"]),
          ],
        )
      ],
    );
  }

  Column _cardsD(BuildContext context) {
    final available = context.watch<AvailableCardsData>().availableCards;
    return Column(
      children: [
        Row(
          children: [
            CardFieldSelector(name: "2D", clickable: available["2D"]),
            CardFieldSelector(name: "3D", clickable: available["3D"]),
            CardFieldSelector(name: "4D", clickable: available["4D"]),
            CardFieldSelector(name: "5D", clickable: available["5D"]),
            CardFieldSelector(name: "6D", clickable: available["6D"]),
            CardFieldSelector(name: "7D", clickable: available["7D"]),
            CardFieldSelector(name: "8D", clickable: available["8D"]),
          ],
        ),
        Row(
          children: [
            CardFieldSelector(name: "9D", clickable: available["9D"]),
            CardFieldSelector(name: "10D", clickable: available["10D"]),
            CardFieldSelector(name: "JD", clickable: available["JD"]),
            CardFieldSelector(name: "QD", clickable: available["QD"]),
            CardFieldSelector(name: "KD", clickable: available["KD"]),
            CardFieldSelector(name: "AD", clickable: available["AD"]),
          ],
        )
      ],
    );
  }

  Column _cardsH(BuildContext context) {
    final available = context.watch<AvailableCardsData>().availableCards;
    return Column(
      children: [
        Row(
          children: [
            CardFieldSelector(name: "2H", clickable: available["2H"]),
            CardFieldSelector(name: "3H", clickable: available["3H"]),
            CardFieldSelector(name: "4H", clickable: available["4H"]),
            CardFieldSelector(name: "5H", clickable: available["5H"]),
            CardFieldSelector(name: "6H", clickable: available["6H"]),
            CardFieldSelector(name: "7H", clickable: available["7H"]),
            CardFieldSelector(name: "8H", clickable: available["8H"]),
          ],
        ),
        Row(
          children: [
            CardFieldSelector(name: "9H", clickable: available["9H"]),
            CardFieldSelector(name: "10H", clickable: available["10H"]),
            CardFieldSelector(name: "JH", clickable: available["JH"]),
            CardFieldSelector(name: "QH", clickable: available["QH"]),
            CardFieldSelector(name: "KH", clickable: available["KH"]),
            CardFieldSelector(name: "AH", clickable: available["AH"]),
          ],
        )
      ],
    );
  }

  Column _cardsS(BuildContext context) {
    final available = context.watch<AvailableCardsData>().availableCards;
    return Column(
      children: [
        Row(
          children: [
            CardFieldSelector(name: "2S", clickable: available["2S"]),
            CardFieldSelector(name: "3S", clickable: available["3S"]),
            CardFieldSelector(name: "4S", clickable: available["4S"]),
            CardFieldSelector(name: "5S", clickable: available["5S"]),
            CardFieldSelector(name: "6S", clickable: available["6S"]),
            CardFieldSelector(name: "7S", clickable: available["7S"]),
            CardFieldSelector(name: "8S", clickable: available["8S"]),
          ],
        ),
        Row(
          children: [
            CardFieldSelector(name: "9S", clickable: available["9S"]),
            CardFieldSelector(name: "10S", clickable: available["10S"]),
            CardFieldSelector(name: "JS", clickable: available["JS"]),
            CardFieldSelector(name: "QS", clickable: available["QS"]),
            CardFieldSelector(name: "KS", clickable: available["KS"]),
            CardFieldSelector(name: "AS", clickable: available["AS"]),
          ],
        )
      ],
    );
  }

  Column _getCards(BuildContext context, String type) {
    switch (type) {
      case "C":
        return _cardsC(context);
      case "D":
        return _cardsD(context);
      case "H":
        return _cardsH(context);
      case "S":
        return _cardsS(context);
    }

    return _cardsC(context);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Theme.of(context).primaryColor,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
        height: MediaQuery.of(context).size.width / 7 / 691 * 1056 * 2,
        child: _getCards(
            context, context.watch<CardFieldsData>().cardSelectorType));
  }
}
