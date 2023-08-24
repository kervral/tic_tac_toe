import 'package:flutter/material.dart';

import '/domain/tic_tac_toe/tic_tac_toe.dart';
import '/widgets/button.dart';
import '/widgets/game_board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TicTacToe game = TicTacToe();

  final int _animationDuration = 500;
  bool _retryButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    if (game.winner != null || game.isDraw) {
      setState(() {
        _retryButtonVisible = true;
      });
      // Winner effect
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _title(game),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GameBoard(
              game: game,
              refresh: () => setState(() {}),
            ),
          ),
          AnimatedOpacity(
            opacity: _retryButtonVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: _animationDuration),
            child: Button(
              onPressed: () {
                setState(() {
                  game = TicTacToe();
                  _retryButtonVisible = false;
                });
              },
              text: 'Retry',
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(TicTacToe game) {
    final String titleText = game.isDraw
        ? "It's a draw !"
        : game.winner == null
            ? "'s turn"
            : 'wins !';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (game.isDraw)
          Container()
        else
          Icon(
            game.currentPlayer.icon.icon,
            color: game.currentPlayer.icon.color,
            size: Theme.of(context).textTheme.labelLarge?.fontSize,
          ),
        Text(
          titleText,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
