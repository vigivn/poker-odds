import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:poker_odds/widgets/card_selector.dart';
import 'package:poker_odds/widgets/community_desk.dart';
import 'package:poker_odds/widgets/player_desk.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PlayerDesk> _playersDesk = [];

  @override
  Widget build(BuildContext context) {
    var index = 0;
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
        context.read<Data>().cardSelectorType = type;
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
            context.watch<Data>().showCardSelector
                ? CardSelector()
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _playersDesk.add(context.read<Data>().newPlayerDesk());
          });
        },
      ),
      bottomNavigationBar:
          context.watch<Data>().showCardSelector ? curvedNavigationBar : null,
    );
  }
}
