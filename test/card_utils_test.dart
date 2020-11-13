import 'package:poker_odds/utils/card_utils.dart';
import 'package:test/test.dart';

main() {
  test("value as letter", () {
    expect(CardUtils().valueAsLetter(4), "4");
    expect(CardUtils().valueAsLetter(10), "10");
    expect(CardUtils().valueAsLetter(11), "J");
    expect(CardUtils().valueAsLetter(12), "Q");
    expect(CardUtils().valueAsLetter(13), "K");
    expect(CardUtils().valueAsLetter(14), "A");
  });

  test("value as num", () {
    expect(CardUtils().valueAsNum("4"), 4);
    expect(CardUtils().valueAsNum("10"), 10);
    expect(CardUtils().valueAsNum("J"), 11);
    expect(CardUtils().valueAsNum("Q"), 12);
    expect(CardUtils().valueAsNum("K"), 13);
    expect(CardUtils().valueAsNum("A"), 14);
  });
}
