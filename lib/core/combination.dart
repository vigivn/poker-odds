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
      return Combo(ComboType.Quads, best.first.valueAsNum,
          getKicker(cards, best).valueAsNum);
    }

    best = getFullHouse(cards);
    if (best.isNotEmpty) {
      return Combo(ComboType.FullHouse, best.first.valueAsNum, 0);
    }

    best = getFlush(cards);
    if (best.isNotEmpty) {
      return Combo(ComboType.Flush, best.first.valueAsNum, 0);
    }

    best = getStraight(cards);
    if (best.isNotEmpty) {
      return Combo(ComboType.Straight, best.first.valueAsNum, 0);
    }

    best = getSet(cards);
    if (best.isNotEmpty) {
      return Combo(ComboType.Set, best.first.valueAsNum,
          getKicker(cards, best).valueAsNum);
    }

    best = get2Pairs(cards);
    if (best.isNotEmpty) {
      return Combo(
          ComboType.TwoPairs,
          best.first.valueAsNum + best[2].valueAsNum,
          getKicker(cards, best).valueAsNum);
    }

    best = getPair(cards);
    if (best.isNotEmpty) {
      return Combo(ComboType.Pair, best.first.valueAsNum,
          getKicker(cards, best).valueAsNum);
    }

    final highCard = getHighCard(cards);
    return Combo(ComboType.HighCard, highCard.valueAsNum, highCard.valueAsNum);
  }

  Card getKicker(List<Card> all, List<Card> combo) {
    final other = all.where((element) => !combo.contains(element)).toList();
    other.sort((b, a) => a.valueAsNum.compareTo(b.valueAsNum));
    return other.first;
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
    for (var i = 4; i < cards.length; i++) {
      if (cards[i - 4].valueAsNum - 4 == cards[i].valueAsNum &&
          cards[i - 3].valueAsNum - 3 == cards[i].valueAsNum &&
          cards[i - 2].valueAsNum - 2 == cards[i].valueAsNum &&
          cards[i - 1].valueAsNum - 1 == cards[i].valueAsNum) {
        return [
          cards[i - 4],
          cards[i - 3],
          cards[i - 2],
          cards[i - 1],
          cards[i],
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
