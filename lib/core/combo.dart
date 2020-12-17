enum ComboType {
  HighCard,
  Pair,
  TwoPairs,
  Set,
  Straight,
  Flush,
  FullHouse,
  Quads,
  StraightFlush
}

class Combo {
  Combo(this._type, this._highCardValue, this._kickerValue);
  ComboType _type;
  int _highCardValue;
  int _kickerValue;

  ComboType get type => _type;

  int get highCardValue => _highCardValue;

  int get kickerValue => _kickerValue;

  int compareTo(Combo other) {
    if (_type.index.compareTo(other._type.index) != 0)
      return _type.index.compareTo(other._type.index);
    else if (_highCardValue.compareTo(other._highCardValue) != 0)
      return _highCardValue.compareTo(other._highCardValue);
    else
      return _kickerValue.compareTo(other._kickerValue);
  }

  @override
  String toString() {
    return "type: $_type, hcv: $_highCardValue, kickerValue: $_kickerValue";
  }
}
