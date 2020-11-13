import 'package:poker_odds/core/card.dart';
import 'package:poker_odds/core/combination.dart';
import 'package:poker_odds/core/combo.dart';
import 'package:test/test.dart';

main() {
  test("2 pairs", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.H, 14),
      Card(CardType.C, 8),
      Card(CardType.D, 11),
      Card(CardType.S, 8),
      Card(CardType.C, 6),
    ];
    final combo = Combination().bestCombo(cards);
    expect(combo.type, ComboType.TwoPairs);
    expect(combo.highCardValue, 14);
    expect(combo.kickerValue, 14);
  });

  test("flush", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.H, 14),
      Card(CardType.H, 8),
      Card(CardType.H, 11),
      Card(CardType.C, 6),
      Card(CardType.H, 7),
      Card(CardType.H, 7),
    ];
    final combo = Combination().bestCombo(cards);
    expect(combo.type, ComboType.Flush);
    expect(combo.highCardValue, 14);
    expect(combo.kickerValue, 0);
  });

  test("compare pair for 2 players", () {
    final community = [
      Card(CardType.C, 2),
      Card(CardType.H, 6),
      Card(CardType.D, 7),
      Card(CardType.H, 10),
      Card(CardType.C, 9),
    ];
    final player1 = [
      Card(CardType.C, 3),
      Card(CardType.H, 6),
    ];
    final player2 = [
      Card(CardType.C, 9),
      Card(CardType.H, 3),
    ];

    final combo1 = Combination().bestCombo(community + player1);
    expect(combo1.type, ComboType.Pair);
    expect(combo1.highCardValue, 6);
    expect(combo1.kickerValue, 10);

    final combo2 = Combination().bestCombo(community + player2);
    expect(combo2.type, ComboType.Pair);
    expect(combo2.highCardValue, 9);
    expect(combo2.kickerValue, 10);
  });
}
