import 'package:flutter/material.dart';

import '/screens/game_screen.dart';
import '/widgets/button.dart';
import '/widgets/tic_tac_toe_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const TicTacToeLogo(),
          Button(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const GameScreen(),
                ),
              );
            },
            text: 'Play',
          ),
        ],
      ),
    );
  }
}
