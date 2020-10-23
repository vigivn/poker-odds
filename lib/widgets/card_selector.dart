import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:poker_odds/widgets/card_field_selector.dart';
import 'package:provider/provider.dart';

class CardSelector extends StatefulWidget {
  @override
  _CardSelectorState createState() => _CardSelectorState();
}

class _CardSelectorState extends State<CardSelector> {
  final _cardsC = Column(
    children: [
      Row(
        children: [
          CardFieldSelector(name: "2C"),
          CardFieldSelector(name: "3C"),
          CardFieldSelector(name: "4C"),
          CardFieldSelector(name: "5C"),
          CardFieldSelector(name: "6C"),
          CardFieldSelector(name: "7C"),
          CardFieldSelector(name: "8C"),
        ],
      ),
      Row(
        children: [
          CardFieldSelector(name: "9C"),
          CardFieldSelector(name: "10C"),
          CardFieldSelector(name: "JC"),
          CardFieldSelector(name: "QC"),
          CardFieldSelector(name: "KC"),
          CardFieldSelector(name: "AC"),
        ],
      )
    ],
  );

  final _cardsD = Column(
    children: [
      Row(
        children: [
          CardFieldSelector(name: "2D"),
          CardFieldSelector(name: "3D"),
          CardFieldSelector(name: "4D"),
          CardFieldSelector(name: "5D"),
          CardFieldSelector(name: "6D"),
          CardFieldSelector(name: "7D"),
          CardFieldSelector(name: "8D"),
        ],
      ),
      Row(
        children: [
          CardFieldSelector(name: "9D"),
          CardFieldSelector(name: "10D"),
          CardFieldSelector(name: "JD"),
          CardFieldSelector(name: "QD"),
          CardFieldSelector(name: "KD"),
          CardFieldSelector(name: "AD"),
        ],
      )
    ],
  );

  final _cardsH = Column(
    children: [
      Row(
        children: [
          CardFieldSelector(name: "2H"),
          CardFieldSelector(name: "3H"),
          CardFieldSelector(name: "4H"),
          CardFieldSelector(name: "5H"),
          CardFieldSelector(name: "6H"),
          CardFieldSelector(name: "7H"),
          CardFieldSelector(name: "8H"),
        ],
      ),
      Row(
        children: [
          CardFieldSelector(name: "9H"),
          CardFieldSelector(name: "10H"),
          CardFieldSelector(name: "JH"),
          CardFieldSelector(name: "QH"),
          CardFieldSelector(name: "KH"),
          CardFieldSelector(name: "AH"),
        ],
      )
    ],
  );

  final _cardsS = Column(
    children: [
      Row(
        children: [
          CardFieldSelector(name: "2S"),
          CardFieldSelector(name: "3S"),
          CardFieldSelector(name: "4S"),
          CardFieldSelector(name: "5S"),
          CardFieldSelector(name: "6S"),
          CardFieldSelector(name: "7S"),
          CardFieldSelector(name: "8S"),
        ],
      ),
      Row(
        children: [
          CardFieldSelector(name: "9S"),
          CardFieldSelector(name: "10S"),
          CardFieldSelector(name: "JS"),
          CardFieldSelector(name: "QS"),
          CardFieldSelector(name: "KS"),
          CardFieldSelector(name: "AS"),
        ],
      )
    ],
  );

  Column _getCards(String type) {
    switch (type) {
      case "C":
        return _cardsC;
      case "D":
        return _cardsD;
      case "H":
        return _cardsH;
      case "S":
        return _cardsS;
    }

    return _cardsC;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Theme.of(context).primaryColor,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
        height: MediaQuery.of(context).size.width / 7 / 691 * 1056 * 2,
        child: _getCards(context.watch<Data>().cardSelectorType));
  }
}
