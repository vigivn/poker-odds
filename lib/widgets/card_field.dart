import 'package:flutter/material.dart';
import 'package:poker_odds/utils/card_utils.dart';

class CardField extends StatefulWidget {
  CardField({@required this.name});

  String name;

  @override
  _CardFieldState createState() => _CardFieldState();
}

class _CardFieldState extends State<CardField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          child: Center(
            child: (widget.name == null || widget.name == "")
                ? Icon(Icons.add)
                : Image.asset('assets/images/${widget.name}.png'),
          ),
          splashColor: Theme.of(context).accentColor,
          onTap: () {
            setState(() {
              widget.name == ""
                  ? widget.name = CardUtils().randomName
                  : widget.name = "";
            });
          },
        ),
      ),
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.width / 5 / 691 * 1056,
    );
  }
}
