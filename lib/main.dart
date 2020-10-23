import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

main(List<String> args) => runApp(PokerChanceApp());

class PokerChanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
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
    );
  }
}
