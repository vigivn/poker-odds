import 'dart:math';

class CardUtils {
  final names = const [
    "2C",
    "2D",
    "2H",
    "2S",
    "3C",
    "3D",
    "3H",
    "3S",
    "4C",
    "4D",
    "4H",
    "4S",
    "5C",
    "5D",
    "5H",
    "5S",
    "6C",
    "6D",
    "6H",
    "6S",
    "7C",
    "7D",
    "7H",
    "7S",
    "8C",
    "8D",
    "8H",
    "8S",
    "9C",
    "9D",
    "9H",
    "9S",
    "10C",
    "10D",
    "10H",
    "10S",
    "JC",
    "JD",
    "JH",
    "JS",
    "QC",
    "QD",
    "QH",
    "QS",
    "KC",
    "KD",
    "KH",
    "KS",
    "AC",
    "AD",
    "AH",
    "AS",
  ];

  List<String> generateAllNames() {
    var names = <String>[];
    for (var i = 2; i <= 10; i++) {
      names.addAll(["${i}C", "${i}D", "${i}H", "${i}S"]);
    }
    names.addAll(["JC", "JD", "JH", "JS"]);
    names.addAll(["QC", "QD", "QH", "QS"]);
    names.addAll(["KC", "KD", "KH", "KS"]);
    names.addAll(["AC", "AD", "AH", "AS"]);

    return names;
  }

  String get randomName {
    return names[Random().nextInt(names.length)];
  }
}
