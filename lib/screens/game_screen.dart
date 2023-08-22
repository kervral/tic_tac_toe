import 'package:flutter/material.dart';

import '../domain/tic_tac_toe/tic_tac_toe.dart';
import '../widgets/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TicTacToe game = TicTacToe();

  @override
  Widget build(BuildContext context) {
    if (game.winner != null) {
      // Winner effect
    }

    if (game.isDraw) {
      // Draw effect
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                game.currentPlayer.icon,
                Text(
                  "'s turn",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          GameBoard(
            game: game,
            refresh: () => setState(() {}),
          ),
        ],
      ),
    );
  }
}
