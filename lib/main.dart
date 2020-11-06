import 'package:flutter/material.dart';
import 'package:poker_odds/data/available_cards_data.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

main(List<String> args) => runApp(PokerChanceApp());

class PokerChanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardFieldsData>(
      create: (context) => CardFieldsData(),
      child: ChangeNotifierProvider<AvailableCardsData>(
        create: (context) => AvailableCardsData(),
        child: MaterialApp(
          title: "Poker Odds",
          theme: ThemeData(
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent,
            textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.white),
            ),
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
