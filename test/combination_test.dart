import 'package:poker_odds/core/card.dart';
import 'package:poker_odds/core/combination.dart';
import 'package:test/test.dart';

main() {
  test("kicker", () {
    final all = [
      Card(CardType.C, 6),
      Card(CardType.C, 14),
      Card(CardType.C, 8),
      Card(CardType.C, 11),
      Card(CardType.C, 8),
      Card(CardType.C, 6),
    ];
    final combo = [
      Card(CardType.C, 6),
      Card(CardType.C, 8),
      Card(CardType.C, 8),
      Card(CardType.C, 6),
    ];
    final kicker = Combination().getKicker(all, combo);
    expect(kicker.valueAsNum, 14);
  });

  test("top card", () {
    final cards = [
      Card(CardType.C, 8),
      Card(CardType.C, 14),
      Card(CardType.C, 6),
      Card(CardType.C, 11),
    ];
    final card = Combination().getHighCard(cards);
    expect(card.valueAsNum, 14);
  });

  test("top pair (pair available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 14),
      Card(CardType.C, 8),
      Card(CardType.C, 11),
      Card(CardType.C, 8),
      Card(CardType.C, 6),
    ];
    final pair = Combination().getPair(cards);
    expect(pair.length, 2);
    expect(pair[0].valueAsNum, 8);
    expect(pair[1].valueAsNum, 8);
  });

  test("top pair (pair not available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 11),
      Card(CardType.C, 8),
    ];
    final pair = Combination().getPair(cards);
    expect(pair.length, 0);
  });

  test("2 pairs (2 pairs available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 11),
      Card(CardType.C, 8),
      Card(CardType.C, 8),
      Card(CardType.C, 6),
    ];
    final pairs = Combination().get2Pairs(cards);
    expect(pairs.length, 4);
    expect(pairs[0].valueAsNum, 8);
    expect(pairs[1].valueAsNum, 8);
    expect(pairs[2].valueAsNum, 6);
    expect(pairs[3].valueAsNum, 6);
  });

  test("2 pairs (2 pairs not available, Four of a kind available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 6),
      Card(CardType.C, 6),
      Card(CardType.C, 6),
      Card(CardType.C, 7),
    ];
    final pairs = Combination().get2Pairs(cards);
    expect(pairs.length, 0);
  });

  test("set (set available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 14),
      Card(CardType.C, 8),
      Card(CardType.C, 6),
      Card(CardType.C, 8),
      Card(CardType.C, 8),
    ];
    final combo = Combination().getSet(cards);
    expect(combo.length, 3);
    expect(combo[0].valueAsNum, 8);
    expect(combo[1].valueAsNum, 8);
    expect(combo[2].valueAsNum, 8);
  });

  test("top pair (set not available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 11),
      Card(CardType.C, 8),
      Card(CardType.C, 8),
    ];
    final combo = Combination().getSet(cards);
    expect(combo.length, 0);
  });

  test("top straight (2 straights available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 9),
      Card(CardType.C, 8),
      Card(CardType.C, 7),
      Card(CardType.C, 10),
      Card(CardType.C, 5),
    ];
    final straight = Combination().getStraight(cards);
    expect(straight.length, 5);
    expect(straight[0].valueAsNum, 10);
    expect(straight[1].valueAsNum, 9);
    expect(straight[2].valueAsNum, 8);
    expect(straight[3].valueAsNum, 7);
    expect(straight[4].valueAsNum, 6);
  });

  test("top straight (straight not available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 2),
      Card(CardType.C, 8),
      Card(CardType.C, 7),
      Card(CardType.C, 10),
      Card(CardType.C, 5),
    ];
    final straight = Combination().getStraight(cards);
    expect(straight.length, 0);
  });

  test("top flush (2 flushs available)", () {
    final cards = [
      Card(CardType.C, 6),
      Card(CardType.C, 9),
      Card(CardType.C, 8),
      Card(CardType.H, 7),
      Card(CardType.C, 10),
      Card(CardType.C, 5),
      Card(CardType.C, 2),
    ];
    final flush = Combination().getFlush(cards);
    expect(flush.length, 5);

    expect(flush[0].type, CardType.C);
    expect(flush[1].type, CardType.C);
    expect(flush[2].type, CardType.C);
    expect(flush[3].type, CardType.C);
    expect(flush[4].type, CardType.C);

    expect(flush[0].valueAsNum, 10);
    expect(flush[1].valueAsNum, 9);
    expect(flush[2].valueAsNum, 8);
    expect(flush[3].valueAsNum, 6);
    expect(flush[4].valueAsNum, 5);
  });

  test("top flush (flush not available)", () {
    final cards = [
      Card(CardType.D, 6),
      Card(CardType.C, 2),
      Card(CardType.H, 8),
      Card(CardType.C, 7),
      Card(CardType.C, 10),
      Card(CardType.C, 5),
    ];
    final flush = Combination().getFlush(cards);
    expect(flush.length, 0);
  });

  test("full house (available)", () {
    final cards = [
      Card(CardType.D, 6),
      Card(CardType.C, 6),
      Card(CardType.H, 8),
      Card(CardType.C, 8),
      Card(CardType.C, 10),
      Card(CardType.C, 8),
    ];
    final fullHouse = Combination().getFullHouse(cards);
    expect(fullHouse.length, 5);
    expect(fullHouse[0].valueAsNum, 8);
    expect(fullHouse[1].valueAsNum, 8);
    expect(fullHouse[2].valueAsNum, 8);
    expect(fullHouse[3].valueAsNum, 6);
    expect(fullHouse[4].valueAsNum, 6);
  });

  test("quads (available)", () {
    final cards = [
      Card(CardType.D, 6),
      Card(CardType.C, 8),
      Card(CardType.H, 8),
      Card(CardType.C, 8),
      Card(CardType.C, 10),
      Card(CardType.C, 8),
    ];
    final quads = Combination().getQuads(cards);
    expect(quads.length, 4);
    expect(quads[0].valueAsNum, 8);
    expect(quads[1].valueAsNum, 8);
    expect(quads[2].valueAsNum, 8);
    expect(quads[3].valueAsNum, 8);
  });

  test("straight flush (available)", () {
    final cards = [
      Card(CardType.H, 6),
      Card(CardType.H, 2),
      Card(CardType.H, 8),
      Card(CardType.H, 7),
      Card(CardType.H, 9),
      Card(CardType.H, 5),
      Card(CardType.S, 9),
      Card(CardType.S, 5),
    ];
    final straightFlush = Combination().getStraightFlush(cards);
    expect(straightFlush.length, 5);

    expect(straightFlush[0].type, CardType.H);
    expect(straightFlush[1].type, CardType.H);
    expect(straightFlush[2].type, CardType.H);
    expect(straightFlush[3].type, CardType.H);
    expect(straightFlush[4].type, CardType.H);

    expect(straightFlush[0].valueAsNum, 9);
    expect(straightFlush[1].valueAsNum, 8);
    expect(straightFlush[2].valueAsNum, 7);
    expect(straightFlush[3].valueAsNum, 6);
    expect(straightFlush[4].valueAsNum, 5);
  });
}
