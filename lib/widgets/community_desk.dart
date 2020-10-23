import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:provider/provider.dart';

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
          context.watch<Data>().desk[0],
          context.watch<Data>().desk[1],
          context.watch<Data>().desk[2],
          context.watch<Data>().desk[3],
          context.watch<Data>().desk[4],
        ],
      ),
    );
  }
}
