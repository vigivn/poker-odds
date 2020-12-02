import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:poker_odds/widgets/card_selector.dart';
import 'package:poker_odds/widgets/community_desk.dart';
import 'package:poker_odds/widgets/player_desk.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _itemScrollController = ItemScrollController();
  var _scrollItemIndex;
  var _cardSelectorIndex;

  @override
  void initState() {
    _scrollItemIndex = 0;
    _cardSelectorIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PlayerDesk> _playersDesk = context.watch<CardFieldsData>().players;
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
      index: _cardSelectorIndex,
      animationCurve: Curves.easeInOut,
      height: 50,
      onTap: (int index) {
        if (_cardSelectorIndex == index)
          context.read<CardFieldsData>().showCardSelector = false;
        else
          setState(() {
            _cardSelectorIndex = index;
          });
      },
    );

    final _playersListView = ScrollablePositionedList.builder(
      itemCount: _playersDesk.length,
      itemScrollController: _itemScrollController,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: [
              IconSlideAction(
                caption: 'remove',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  setState(() {
                    _playersDesk[index].remove(context);
                  });
                },
              ),
            ],
            child: _playersDesk[index]);
      },
    );

    final selectedCardKey =
        Provider.of<CardFieldsData>(context, listen: false).selectedFieldKey;
    for (var player in _playersDesk) {
      if (player.cardKey1 == selectedCardKey ||
          player.cardKey2 == selectedCardKey) {
        _scrollItemIndex = _playersDesk.indexOf(player);
      }
    }

    //scroll to player
    if (_playersDesk.length >= 2) {
      print(_scrollItemIndex);
      _itemScrollController.scrollTo(
          index: _scrollItemIndex, duration: Duration(milliseconds: 200));
    }
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Poker Odds"),
      ),
      body: Container(
        child: Column(
          children: [
            CommunityDesk(),
            Expanded(
              child: _playersListView,
            ),
            context.watch<CardFieldsData>().showCardSelector
                ? CardSelector(_cardSelectorIndex)
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: context.watch<CardFieldsData>().showCardSelector
          ? null
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                if (context.read<CardFieldsData>().players.length < 5) {
                  context.read<CardFieldsData>().newPlayerDesk();
                  setState(() {
                    _scrollItemIndex = _playersDesk.length - 1;
                  });
                } else
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text(
                    "max can be 5 players",
                    textAlign: TextAlign.center,
                  )));
              },
            ),
      bottomNavigationBar: context.watch<CardFieldsData>().showCardSelector
          ? curvedNavigationBar
          : null,
    );
  }
}
