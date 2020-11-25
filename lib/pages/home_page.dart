import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:poker_odds/widgets/card_selector.dart';
import 'package:poker_odds/widgets/community_desk.dart';
import 'package:poker_odds/widgets/player_desk.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var index = 0;
    List<PlayerDesk> _playersDesk = context.watch<CardFieldsData>().players;
    switch (context.watch<CardFieldsData>().cardSelectorType) {
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

        if (context.read<CardFieldsData>().cardSelectorType == type)
          context.read<CardFieldsData>().showCardSelector = false;
        else
          context.read<CardFieldsData>().cardSelectorType = type;
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
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                itemCount: _playersDesk.length,
                itemBuilder: (BuildContext context, int index) {
                  return _playersDesk[index];
                },
              ),
            ),
            context.watch<CardFieldsData>().showCardSelector
                ? CardSelector()
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: context.watch<CardFieldsData>().showCardSelector
          ? null
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<CardFieldsData>().newPlayerDesk();
              },
            ),
      bottomNavigationBar: context.watch<CardFieldsData>().showCardSelector
          ? curvedNavigationBar
          : null,
    );
  }
}
