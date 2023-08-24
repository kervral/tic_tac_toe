import 'package:flutter/material.dart';

import '../domain/tic_tac_toe/tic_tac_toe.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({required this.game, required this.refresh, super.key});

  final TicTacToe game;
  final VoidCallback refresh;

  @override
  State<GameBoard> createState() => _BoardState();
}

class _BoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[..._buildCells()],
    );
  }

  List<Widget> _buildCells() {
    return <Widget>[
      for (int x = 0; x < widget.game.board.length; x++)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int y = 0; y < widget.game.board[x].length; y++)
              InkWell(
                onTap: () {
                  widget.game.play(x, y);
                  widget.refresh();
                },
                child: Container(
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: FittedBox(
                    child: widget.game.board[x][y] != null
                        ? widget.game.board[x][y]!.icon
                        : Container(),
                  ),
                ),
              ),
          ],
        ),
    ];
  }
}
