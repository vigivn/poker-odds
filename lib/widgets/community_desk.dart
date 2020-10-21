import 'package:flutter/material.dart';
import 'package:poker_odds/widgets/card_field.dart';

class CommunityDesk extends StatefulWidget {
  @override
  _CommunityDeskState createState() => _CommunityDeskState();
}

class _CommunityDeskState extends State<CommunityDesk> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CardField(name: ""),
          CardField(name: ""),
          CardField(name: ""),
          CardField(name: ""),
          CardField(name: ""),
        ],
      ),
    );
  }
}
