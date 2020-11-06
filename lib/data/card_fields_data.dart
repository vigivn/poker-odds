import 'package:flutter/material.dart';
import 'package:poker_odds/widgets/card_field_board.dart';
import 'package:poker_odds/widgets/player_desk.dart';

class CardFieldsData with ChangeNotifier {
  String _cardSelectorType = "C";
  bool _showCardSelector = false;
  GlobalKey<CardFieldBoardState> _selectedFieldKey =
      GlobalKey<CardFieldBoardState>();

  List<GlobalKey<CardFieldBoardState>> _communityDeskKeys = [
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
  ];

  String get cardSelectorType {
    return _cardSelectorType;
  }

  bool get showCardSelector {
    return _showCardSelector;
  }

  List<GlobalKey<CardFieldBoardState>> get communityDeskKeys {
    return _communityDeskKeys;
  }

  GlobalKey<CardFieldBoardState> get selectedFieldKey {
    return _selectedFieldKey;
  }

  set cardSelectorType(String type) {
    _cardSelectorType = type;
    notifyListeners();
  }

  set showCardSelector(bool value) {
    _showCardSelector = value;
    notifyListeners();
  }

  set selectedField(GlobalKey<CardFieldBoardState> cardFieldKey) {
    _selectedFieldKey = cardFieldKey;

    notifyListeners();
  }

  PlayerDesk newPlayerDesk(Function remove) {
    return PlayerDesk(
      cardKey1: GlobalKey<CardFieldBoardState>(),
      cardKey2: GlobalKey<CardFieldBoardState>(),
      remove: remove,
    );
  }
}
