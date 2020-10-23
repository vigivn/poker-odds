import 'package:flutter/material.dart';
import 'package:poker_odds/data/data.dart';
import 'package:provider/provider.dart';

class CardFieldBoard extends StatelessWidget {
  CardFieldBoard({
    @required this.name,
    @required this.index,
  });

  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    var showCardSelecor = context.watch<Data>().showCardSelector;
    return Container(
      child: Card(
        child: InkWell(
          child: Center(
            child: (name == null || name == "")
                ? Icon(Icons.add)
                : Image.asset('assets/images/$name.png'),
          ),
          splashColor: Theme.of(context).accentColor,
          onTap: () {
            if (name == "") {
              if (!showCardSelecor) {
                context.read<Data>().updateShowCardSelector(true);
                context.read<Data>().updateCurrCardFieldIdex(index);
              } else {
                context.read<Data>().updateShowCardSelector(false);
                context.read<Data>().updateCurrCardFieldIdex(-1);
              }
            } else {
              context.read<Data>().updateShowCardSelector(false);
              context.read<Data>().updateDesk(index, "");
              context.read<Data>().updateCurrCardFieldIdex(-1);
            }
          },
        ),
      ),
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5 / 691 * 1056,
    );
  }
}
