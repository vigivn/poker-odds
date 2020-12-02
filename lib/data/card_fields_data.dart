import 'package:flutter/material.dart';
import 'package:poker_odds/widgets/card_field_board.dart';
import 'package:poker_odds/widgets/player_desk.dart';
import 'package:poker_odds/widgets/result_field_board.dart';

class CardFieldsData with ChangeNotifier {
  bool _showCardSelector = false;
  bool get showCardSelector => _showCardSelector;

  GlobalKey<CardFieldBoardState> _selectedFieldKey =
      GlobalKey<CardFieldBoardState>();
  GlobalKey<CardFieldBoardState> get selectedFieldKey => _selectedFieldKey;

  List<GlobalKey<CardFieldBoardState>> _communityDeskKeys = [
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
    GlobalKey<CardFieldBoardState>(),
  ];
  List<GlobalKey<CardFieldBoardState>> get communityDeskKeys =>
      _communityDeskKeys;

  List<PlayerDesk> _players = [];
  List<PlayerDesk> get players => _players;

  set showCardSelector(bool value) {
    _showCardSelector = value;
    notifyListeners();
  }

  set selectedField(GlobalKey<CardFieldBoardState> cardFieldKey) {
    _selectedFieldKey = cardFieldKey;

    notifyListeners();
  }

  void newPlayerDesk() {
    players.add(PlayerDesk(
      cardKey1: GlobalKey<CardFieldBoardState>(),
      cardKey2: GlobalKey<CardFieldBoardState>(),
      result: GlobalKey<ResultFieldBoardState>(),
    ));

    notifyListeners();
  }

  void removePlayerDesk(PlayerDesk player) {
    _players.remove(player);
    notifyListeners();
  }
}
