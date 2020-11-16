import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice'),
        backgroundColor: Colors.red.shade700,
      ),
      backgroundColor: Colors.red.shade800,
      body: DicePanel(count: 2),
    );
  }
}

class DicePanel extends StatefulWidget {
  final int count;

  DicePanel({Key key, this.count}) : super(key: key);

  @override
  _DicePanelState createState() => _DicePanelState();
}

class _DicePanelState extends State<DicePanel> {
  List<int> numbers;
  var rng = new Random();

  handleRandom() {
    for (var i = 0; i < numbers.length; i++) {
      numbers[i] = rng.nextInt(6) + 1;
    }
  }

  handleTap() {
    setState(() {
      handleRandom();
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState: ${widget.count}');
    numbers = List<int>(widget.count);
    handleRandom();
  }

  @override
  Widget build(BuildContext context) {
    var dices = <Widget>[];
    for (var i = 0; i < numbers.length; i++) {
      dices.add(Expanded(
        child: Dice(number: numbers[i]),
      ));
    }
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        color: Colors.red.shade800,
        child: Center(
          child: Row(
            children: dices,
          ),
        ),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  static const bgColor = Colors.white;
  final int number;

  Dice({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dots;
    if (number == 1) {
      dots = Center(child: Icon(Icons.circle));
    } else if (number == 2) {
      dots = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.circle),
          Icon(Icons.circle),
        ],
      );
    } else if (number == 3) {
      dots = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle, color: bgColor),
              Icon(Icons.circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle, color: bgColor),
            ],
          ),
        ],
      );
    } else if (number == 4) {
      dots = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle),
            ],
          ),
        ],
      );
    } else if (number == 5) {
      dots = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle, color: bgColor),
              Icon(Icons.circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle, color: bgColor),
              Icon(Icons.circle),
            ],
          ),
        ],
      );
    } else if (number == 6) {
      dots = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.circle),
              Icon(Icons.circle),
            ],
          ),
        ],
      );
    }
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade100, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: bgColor,
        ),
        child: dots,
      ),
    );
  }
}
