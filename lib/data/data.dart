import 'package:flutter/material.dart';
import 'package:poker_odds/widgets/card_field_board.dart';

class Data with ChangeNotifier {
  String _cardSelectorType = "C";
  bool _showCardSelector = false;
  int _currCardFieldIdex = -1;

  var _desk = [
    CardFieldBoard(
      name: "",
      index: 0,
    ),
    CardFieldBoard(
      name: "",
      index: 1,
    ),
    CardFieldBoard(
      name: "",
      index: 2,
    ),
    CardFieldBoard(
      name: "",
      index: 3,
    ),
    CardFieldBoard(
      name: "",
      index: 4,
    ),
  ];

  String get cardSelectorType {
    return _cardSelectorType;
  }

  bool get showCardSelector {
    return _showCardSelector;
  }

  int get currCardFieldIdex {
    return _currCardFieldIdex;
  }

  List<CardFieldBoard> get desk {
    return _desk;
  }

  void updateCardSelectorType(String type) {
    _cardSelectorType = type;
    notifyListeners();
  }

  void updateShowCardSelector(bool value) {
    _showCardSelector = value;
    notifyListeners();
  }

  void updateCurrCardFieldIdex(int index) {
    _currCardFieldIdex = index;
    notifyListeners();
  }

  void updateDesk(int index, String newName) {
    _desk[index] = CardFieldBoard(
      name: newName,
      index: index,
    );

    notifyListeners();
  }
}
