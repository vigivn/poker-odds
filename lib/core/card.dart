import 'dart:math';

import 'package:poker_odds/utils/card_utils.dart';

enum CardType { C, D, H, S }

class Card {
  CardType _type;
  int _value;

  Card(this._type, this._value);

  Card.random() {
    _value = Random().nextInt(13) + 2;
    _type = CardType.values[Random().nextInt(4)];
  }

  Card.fromName(final String name) {
    _value = CardUtils().valueAsNum(name.substring(0, name.length - 1));
    switch (name.substring(name.length - 1)) {
      case "C":
        _type = CardType.C;
        break;
      case "D":
        _type = CardType.D;
        break;
      case "H":
        _type = CardType.H;
        break;
      case "S":
        _type = CardType.S;
        break;
      default:
        _type = CardType.C;
        break;
    }
  }

  int get valueAsNum {
    return _value;
  }

  String get valueAsLetter {
    return CardUtils().valueAsLetter(_value);
  }

  String get name {
    return valueAsLetter + _type.toString().split(".").last;
  }

  CardType get type {
    return _type;
  }
}
