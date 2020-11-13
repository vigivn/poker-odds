import 'package:poker_odds/core/card.dart';
import 'package:test/test.dart';

main() {
  test("constructor fromName", () {
    final card1 = Card.fromName("10D");
    expect(card1.valueAsNum, 10);
    expect(card1.type, CardType.D);

    final card2 = Card.fromName("AD");
    expect(card2.valueAsNum, 14);
    expect(card2.type, CardType.D);
  });
}
