import 'package:flutter/material.dart';
import 'package:poker_odds/widgets/community_desk.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Poker Odds"),
      ),
      body: Container(
        child: Column(
          children: [
            CommunityDesk(),
          ],
        ),
      ),
    );
  }
}
