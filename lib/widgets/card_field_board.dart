import 'package:flutter/material.dart';
import 'package:poker_odds/core/calculator.dart';
import 'package:poker_odds/models/card_selector_model.dart';
import 'package:poker_odds/models/card_fields_model.dart';
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
    var showCardSelecor = context.watch<CardSelectorModel>().showCardSelector;
    return Container(
      child: Card(
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: (_name == null || _name == "")
                ? Icon(Icons.add)
                : Image.asset('assets/images/$_name.png'),
          ),
          splashColor: Theme.of(context).accentColor,
          onTap: () {
            if (_name == "") {
              if (!showCardSelecor) {
                context.read<CardFieldsModel>().selectedField =
                    widget.globalKey;
                context.read<CardSelectorModel>().showCardSelector = true;
              } else {
                context.read<CardSelectorModel>().showCardSelector = false;
              }
            } else {
              context.read<CardSelectorModel>().updateAvailable(_name, true);
              updateName("");
              context.read<CardFieldsModel>().selectedField = null;
              context.read<CardSelectorModel>().showCardSelector = false;
              Calculator().cardUpdated(context);
            }
          },
        ),
      ),
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5 / 690 * 1036,
    );
  }
}
