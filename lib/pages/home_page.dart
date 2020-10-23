import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:poker_odds/widgets/card_selector.dart';
import 'package:poker_odds/widgets/community_desk.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    switch (context.watch<Data>().cardSelectorType) {
      case "C":
        index = 0;
        break;
      case "D":
        index = 1;
        break;
      case "H":
        index = 2;
        break;
      case "S":
        index = 3;
        break;
    }
    var curvedNavigationBar = CurvedNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      items: [
        Image.asset(
          'assets/images/C.png',
          scale: 8,
        ),
        Image.asset(
          'assets/images/D.png',
          scale: 8,
        ),
        Image.asset(
          'assets/images/H.png',
          scale: 8,
        ),
        Image.asset(
          'assets/images/S.png',
          scale: 18,
        ),
      ],
      index: index,
      animationCurve: Curves.easeInOut,
      height: 50,
      onTap: (int index) {
        String type;
        switch (index) {
          case 1:
            type = "D";
            break;
          case 2:
            type = "H";
            break;
          case 3:
            type = "S";
            break;
          default:
            type = "C";
        }
        context.read<Data>().updateCardSelectorType(type);
      },
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Poker Odds"),
      ),
      body: Container(
        child: Column(
          children: [
            CommunityDesk(),
            Expanded(
              child: Container(),
            ),
            context.watch<Data>().showCardSelector
                ? CardSelector()
                : SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar:
          context.watch<Data>().showCardSelector ? curvedNavigationBar : null,
    );
  }
}
