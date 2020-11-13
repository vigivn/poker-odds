import 'package:poker_odds/core/card.dart';
import 'package:poker_odds/core/combination.dart';
import 'package:poker_odds/core/combo.dart';
import 'package:poker_odds/utils/card_utils.dart';

class Calculator {
  static const int SIMULATION_COUNT = 4000;

  List<num> calculate(List<Card> community, List<List<Card>> players) {
    var result = List.filled(players.length, 0);
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
        //print("player $i:\t${combo.type}\t${combo.highCardValue}\t${combo.kickerValue}");
      }
      final combosKeys = combos.keys.toList()..sort((b, a) => a.compareTo(b));

      for (var i = 1; i < combosKeys.length; i++) {
        if (combosKeys[i - 1].compareTo(combosKeys[i]) != 0) {
          result[combos[combosKeys[i - 1]]] += 1;
        } else {
          break;
        }
      }
    }
    return result.map((e) => e / SIMULATION_COUNT * 100).toList();
  }
}
