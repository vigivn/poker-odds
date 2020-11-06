import 'dart:collection';
import 'package:flutter/material.dart';

class AvailableCardsData with ChangeNotifier {
  HashMap<String, bool> _available = HashMap.from({
    "2C": true,
    "3C": true,
    "4C": true,
    "5C": true,
    "6C": true,
    "7C": true,
    "8C": true,
    "9C": true,
    "10C": true,
    "JC": true,
    "QC": true,
    "KC": true,
    "AC": true,
    "2D": true,
    "3D": true,
    "4D": true,
    "5D": true,
    "6D": true,
    "7D": true,
    "8D": true,
    "9D": true,
    "10D": true,
    "JD": true,
    "QD": true,
    "KD": true,
    "AD": true,
    "2H": true,
    "3H": true,
    "4H": true,
    "5H": true,
    "6H": true,
    "7H": true,
    "8H": true,
    "9H": true,
    "10H": true,
    "JH": true,
    "QH": true,
    "KH": true,
    "AH": true,
    "2S": true,
    "3S": true,
    "4S": true,
    "5S": true,
    "6S": true,
    "7S": true,
    "8S": true,
    "9S": true,
    "10S": true,
    "JS": true,
    "QS": true,
    "KS": true,
    "AS": true,
  });

  HashMap<String, bool> get availableCards {
    return _available;
  }

  void updateAvailable(String key, bool value) {
    _available[key] = value;

    notifyListeners();
  }
}
