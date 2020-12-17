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

    Calculator().calculate(community, [player1, player2]).then((value) {
      expect(value.item1[0], 0.0);
      expect(value.item1[1], 100.0);
    });
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

    Calculator().calculate(community, [player1, player2]).then((value) {
      print("${value.item1[0]}%");
      print("${value.item2[1]}%");
    });
  });
}
