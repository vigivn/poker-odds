import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Poker Odds"),
      ),
      body: Container(
        child: Center(
          child: Text("INIT"),
        ),
      ),
    );
  }
}
