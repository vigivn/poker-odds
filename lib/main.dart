import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker_odds/models/card_selector_model.dart';
import 'package:poker_odds/models/card_fields_model.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

main(List<String> args) => runApp(PokerChanceApp());

class PokerChanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardFieldsModel>(
            create: (context) => CardFieldsModel()),
        ChangeNotifierProvider<CardSelectorModel>(
            create: (context) => CardSelectorModel()),
      ],
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
