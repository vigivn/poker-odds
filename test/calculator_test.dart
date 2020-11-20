import 'package:poker_odds/core/calculator.dart';
import 'package:poker_odds/core/card.dart';
import 'package:test/test.dart';

main() {
  test("calculator", () {
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

    final calc = Calculator().calculate(community, [player1, player2]);
    expect(calc.item1[0], 0.0);
    expect(calc.item1[1], 100.0);
  });

  test("calculator random", () {
    final community = [
      Card(CardType.C, 2),
    ];
    final player1 = [
      Card(CardType.C, 5),
      Card(CardType.D, 5),
    ];
    final player2 = [
      Card(CardType.C, 6),
      Card(CardType.D, 6),
    ];

    final calc = Calculator().calculate(community, [player1, player2]);
    print("${calc.item1[0]}%");
    print("${calc.item2[1]}%");
  });
}
