import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart';
import 'package:poker_odds/core/card.dart';
import 'package:poker_odds/core/combination.dart';
import 'package:poker_odds/core/combo.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:poker_odds/utils/card_utils.dart';
import 'package:tuple/tuple.dart';

class Calculator {
  static const int SIMULATION_COUNT = 1000;

  Tuple2<List<num>, List<num>> calculate(
      List<Card> community, List<List<Card>> players) {
    var win = List.filled(players.length, 0);
    var tie = List.filled(players.length, 0);
    List<String> availables = List.from(CardUtils().names);
    for (var card in community) availables.remove(card.name);
    for (var player in players)
      for (var card in player) availables.remove(card.name);

    for (var time = 0; time < SIMULATION_COUNT; time++) {
      availables.shuffle();
      final extra = List.generate(
          5 - community.length, (index) => Card.fromName(availables[index]));
      Map<Combo, int> combos = {};
      for (var i = 0; i < players.length; i++) {
        final combo = Combination().bestCombo(community + players[i] + extra);
        combos[combo] = i;
      }
      final combosKeys = combos.keys.toList()..sort((b, a) => a.compareTo(b));

      if (combosKeys.length >= 2) {
        if (combosKeys[0].compareTo(combosKeys[1]) == 1) {
          win[combos[combosKeys[0]]] += 1;
        }

        for (var i = 0; i < combosKeys.length; i++) {
          if (combosKeys[i].compareTo(combosKeys[1]) == 0) {
            tie[combos[combosKeys[i]]] += 1;
          } else
            break;
        }
      }
    }
    return Tuple2(win.map((e) => e / SIMULATION_COUNT * 100).toList(),
        tie.map((e) => e / SIMULATION_COUNT * 100).toList());
  }

  void cardUpdated(material.BuildContext context) {
    final community = context
        .read<CardFieldsData>()
        .communityDeskKeys
        .where((e) => e.currentState.name != "")
        .map((e) => Card.fromName(e.currentState.name))
        .toList();
    context
        .read<CardFieldsData>()
        .players
        .forEach((e) => {e.result.currentState.updateResult(0, 0)});
    final players = context
        .read<CardFieldsData>()
        .players
        .where((e) =>
            e.cardKey1.currentState.name != "" &&
            e.cardKey2.currentState.name != "")
        .toList();
    final result = Calculator().calculate(
        community,
        players
            .map((e) => [
                  Card.fromName(e.cardKey1.currentState.name),
                  Card.fromName(e.cardKey2.currentState.name)
                ])
            .toList());

    var i = 0;
    for (var player in players) {
      player.result.currentState.updateResult(result.item1[i], result.item2[i]);
      i++;
    }
  }
}
