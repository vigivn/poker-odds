import 'package:flutter/material.dart';
import 'package:poker_odds/core/calculator.dart';
import 'package:poker_odds/data/available_cards_data.dart';
import 'package:poker_odds/data/card_fields_data.dart';
import 'package:provider/provider.dart';

class CardFieldBoard extends StatefulWidget {
  CardFieldBoard({this.globalKey}) : super(key: globalKey);
  final GlobalKey<CardFieldBoardState> globalKey;
  @override
  CardFieldBoardState createState() => CardFieldBoardState();
}

class CardFieldBoardState extends State<CardFieldBoard> {
  String _name;

  @override
  void initState() {
    _name = "";
    super.initState();
  }

  String get name {
    return _name;
  }

  void updateName(final String newName) {
    setState(() {
      _name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    var showCardSelecor = context.watch<CardFieldsData>().showCardSelector;
    return Container(
      child: Card(
        child: InkWell(
          child: Center(
            child: (_name == null || _name == "")
                ? Icon(Icons.add)
                : Image.asset('assets/images/$_name.png'),
          ),
          splashColor: Theme.of(context).accentColor,
          onTap: () {
            if (_name == "") {
              if (!showCardSelecor) {
                context.read<CardFieldsData>().selectedField = widget.globalKey;
                context.read<CardFieldsData>().showCardSelector = true;
              } else {
                context.read<CardFieldsData>().showCardSelector = false;
              }
            } else {
              context.read<AvailableCardsData>().updateAvailable(_name, true);
              updateName("");
              Calculator().cardUpdated(context);
              context.read<CardFieldsData>().showCardSelector = false;
            }
          },
        ),
      ),
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5 / 691 * 1056,
    );
  }
}
