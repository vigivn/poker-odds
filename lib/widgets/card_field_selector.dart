import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:provider/provider.dart';

class CardFieldSelector extends StatelessWidget {
  CardFieldSelector({@required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          child: InkWell(
            child: Center(
              child: Image.asset('assets/images/$name.png'),
            ),
            splashColor: Theme.of(context).accentColor,
            onTap: () {
              context
                  .read<Data>()
                  .selectedFieldKey
                  .currentState
                  .updateName(name);
              context.read<Data>().showCardSelector = false;
            },
          ),
        ),
        width: MediaQuery.of(context).size.width / 7);
  }
}
