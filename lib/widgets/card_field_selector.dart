import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:provider/provider.dart';

class CardFieldSelector extends StatelessWidget {
  CardFieldSelector({@required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    var index = context.watch<Data>().currCardFieldIdex;

    return Container(
        child: Card(
          child: InkWell(
            child: Center(
              child: Image.asset('assets/images/$name.png'),
            ),
            splashColor: Theme.of(context).accentColor,
            onTap: () {
              context.read<Data>().updateDesk(index, name);
              context.read<Data>().updateShowCardSelector(false);
              context.read<Data>().updateCurrCardFieldIdex(-1);
            },
          ),
        ),
        width: MediaQuery.of(context).size.width / 7);
  }
}
