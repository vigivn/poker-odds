import 'package:flutter/material.dart';
import 'pages/home_page.dart';

main(List<String> args) => runApp(PokerChanceApp());

class PokerChanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Poker Odds",
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}
