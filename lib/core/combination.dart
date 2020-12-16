import 'package:poker_odds/core/card.dart';
import 'package:poker_odds/core/combo.dart';

class Combination {
  Combo bestCombo(List<Card> cards) {
    var best = [];

    best = getStraightFlush(cards);
    if (best.isNotEmpty) {
      return Combo(ComboType.StraightFlush, best.first.valueAsNum, 0);
    }

    best = getQuads(cards);
    if (best.isNotEmpty) {
      return Combo(
          ComboType.Quads, best.first.valueAsNum, getKickerValue(cards, best));
    }

    best = getFullHouse(cards);
    if (best.isNotEmpty) {
      return Combo(
          ComboType.FullHouse, best.first.valueAsNum + best[3].valueAsNum, 0);
    }

    best = getFlush(cards);
    if (best.isNotEmpty) {
      return Combo(
          ComboType.Flush,
          best[0].valueAsNum +
              best[1].valueAsNum +
              best[2].valueAsNum +
              best[3].valueAsNum +
              best[4].valueAsNum,
          0);
    }

    best = getStraight(cards);
    if (best.isNotEmpty) {
      return Combo(ComboType.Straight, best.first.valueAsNum, 0);
    }

    best = getSet(cards);
    if (best.isNotEmpty) {
      return Combo(
          ComboType.Set, best.first.valueAsNum, getKickerValue(cards, best));
    }

    best = get2Pairs(cards);
    if (best.isNotEmpty) {
      return Combo(
          ComboType.TwoPairs,
          best.first.valueAsNum + best[2].valueAsNum,
          getKickerValue(cards, best));
    }

    best = getPair(cards);
    if (best.isNotEmpty) {
      return Combo(
          ComboType.Pair, best.first.valueAsNum, getKickerValue(cards, best));
    }

    cards.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    return Combo(
        ComboType.HighCard,
        cards[0].valueAsNum +
            cards[1].valueAsNum +
            cards[2].valueAsNum +
            cards[3].valueAsNum +
            cards[4].valueAsNum,
        cards.first.valueAsNum);
  }

  Card getKicker(List<Card> all, List<Card> combo) {
    final other = all.where((element) => !combo.contains(element)).toList();
    other.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    return other.first;
  }

  int getKickerValue(List<Card> all, List<Card> combo) {
    final other = all.where((element) => !combo.contains(element)).toList();
    other.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    var value = 0;
    for (var i = 0; i < 5 - combo.length; i++) value += other[i].valueAsNum;
    return value;
  }

  Card getHighCard(List<Card> cards) {
    cards.sort((a, b) => a.valueAsNum.compareTo(b.valueAsNum));
    return cards.last;
  }

  List<Card> getPair(List<Card> cards) {
    if (cards.length < 2) return [];
    cards.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    for (var i = 1; i < cards.length; i++) {
      if (cards[i - 1].valueAsNum == cards[i].valueAsNum) {
        return [cards[i - 1], cards[i]];
      }
    }

    return [];
  }

  List<Card> get2Pairs(List<Card> cards) {
    if (cards.length < 4) return [];
    cards.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    List<Card> result = [];
    bool has1Pair = false;
    for (var i = 1; i < cards.length; i++) {
      if (cards[i - 1].valueAsNum == cards[i].valueAsNum) {
        if (!has1Pair) {
          result.add(cards[i - 1]);
          result.add(cards[i]);
          has1Pair = true;
        } else {
          if (cards[i].valueAsNum != result[0].valueAsNum) {
            result.add(cards[i - 1]);
            result.add(cards[i]);
            return result;
          }
        }
      }
    }

    return [];
  }

  List<Card> getSet(List<Card> cards) {
    if (cards.length < 3) return [];
    cards.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    for (var i = 2; i < cards.length; i++) {
      if (cards[i - 2].valueAsNum == cards[i].valueAsNum) {
        return [cards[i - 2], cards[i - 1], cards[i]];
      }
    }

    return [];
  }

  List<Card> getStraight(List<Card> cards) {
    if (cards.length < 5) return [];
    cards.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));

    var c = [cards.first];
    for (var i = 1; i < cards.length; i++) {
      if (cards[i - 1].valueAsNum != cards[i].valueAsNum) {
        c.add(cards[i]);
      }
    }
    if (c.length < 5) return [];

    for (var i = 4; i < c.length; i++) {
      if (c[i - 4].valueAsNum - 4 == c[i].valueAsNum &&
          c[i - 3].valueAsNum - 3 == c[i].valueAsNum &&
          c[i - 2].valueAsNum - 2 == c[i].valueAsNum &&
          c[i - 1].valueAsNum - 1 == c[i].valueAsNum) {
        return [
          c[i - 4],
          c[i - 3],
          c[i - 2],
          c[i - 1],
          c[i],
        ];
      }
    }

    return [];
  }

  List<Card> getFlush(List<Card> cards) {
    if (cards.length < 5) return [];

    final cardsC =
        cards.where((element) => element.type == CardType.C).toList();
    if (cardsC.length >= 5) {
      cardsC.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
      return cardsC.getRange(0, 5).toList();
    }

    final cardsD =
        cards.where((element) => element.type == CardType.D).toList();
    if (cardsD.length >= 5) {
      cardsD.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
      return cardsD.getRange(0, 5).toList();
    }

    final cardsH =
        cards.where((element) => element.type == CardType.H).toList();
    if (cardsH.length >= 5) {
      cardsH.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
      return cardsH.getRange(0, 5).toList();
    }

    final cardsS =
        cards.where((element) => element.type == CardType.S).toList();
    if (cardsS.length >= 5) {
      cardsS.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
      return cardsS.getRange(0, 5).toList();
    }

    return [];
  }

  List<Card> getFullHouse(List<Card> cards) {
    if (cards.length < 5) return [];
    final setCombo = getSet(cards);
    if (setCombo.isNotEmpty) {
      cards.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
      for (var i = 1; i < cards.length; i++) {
        if (cards[i - 1].valueAsNum == cards[i].valueAsNum &&
            cards[i].valueAsNum != setCombo.first.valueAsNum) {
          return setCombo + [cards[i - 1], cards[i]];
        }
      }
    }

    return [];
  }

  List<Card> getQuads(List<Card> cards) {
    if (cards.length < 4) return [];
    cards.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    for (var i = 3; i < cards.length; i++) {
      if (cards[i - 3].valueAsNum == cards[i].valueAsNum) {
        return [cards[i - 3], cards[i - 2], cards[i - 1], cards[i]];
      }
    }

    return [];
  }

  List<Card> getStraightFlush(List<Card> cards) {
    if (cards.length < 5) return [];
    final c = getStraight(
        cards.where((element) => element.type == CardType.C).toList());
    if (c.isNotEmpty) return c;
    final d = getStraight(
        cards.where((element) => element.type == CardType.D).toList());
    if (d.isNotEmpty) return d;
    final h = getStraight(
        cards.where((element) => element.type == CardType.H).toList());
    if (h.isNotEmpty) return h;
    final s = getStraight(
        cards.where((element) => element.type == CardType.S).toList());
    if (s.isNotEmpty) return s;

    return [];
  }
}
