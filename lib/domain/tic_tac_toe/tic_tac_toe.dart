import 'package:flutter/material.dart';

import '../player/player.dart';
import 'tic_tac_toe.interface.dart';

class TicTacToe implements AbstractTicTacToe {
  TicTacToe();

  Board board = <List<Player?>>[
    <Player?>[null, null, null],
    <Player?>[null, null, null],
    <Player?>[null, null, null],
  ];

  final Player player1 = const Player(
    id: 1,
    icon: Icon(Icons.radio_button_unchecked, color: Colors.red),
  );
  final Player player2 = const Player(
    id: 2,
    icon: Icon(Icons.close_rounded, color: Colors.blue),
  );
  late Player currentPlayer = player1;

  Player? winner;
  bool isDraw = false;

  @override
  Player? findWinner() {
    // Check for horizontal and vertical wins
    for (int i = 0; i < board.length; i++) {
      if (board[i][0] != null &&
          board[i][0]?.id == board[i][1]?.id &&
          board[i][0]?.id == board[i][2]?.id) {
        return board[i][0];
      }

      if (board[0][i] != null &&
          board[0][i]?.id == board[1][i]?.id &&
          board[0][i]?.id == board[2][i]?.id) {
        return board[0][i];
      }
    }

    // Check top-left to bottom-right diagonal win
    if (board[0][0] != null &&
        board[1][1]?.id == board[0][0]?.id &&
        board[2][2]?.id == board[0][0]?.id) {
      return board[0][0];
    }

    // Check top-right to bottom-left diagonal win
    if (board[0][2] != null &&
        board[1][1]?.id == board[0][2]?.id &&
        board[2][0]?.id == board[0][2]?.id) {
      return board[0][2];
    }

    return null;
  }

  @override
  bool isBoardFull() {
    for (final List<Player?> column in board) {
      if (column.any((Player? cell) => cell == null)) {
        return false;
      }
    }

    return true;
  }

  @override
  void play(Player player, int x, int y) {
    // Forbidden move, cell has already been played
    if (board[x][y] != null) {
      throw Error();
    }

    board[x][y] = player;

    final Player? winner = findWinner();
    if (winner != null) {
      this.winner = winner;
      return;
    }

    if (isBoardFull()) {
      isDraw = true;
      return;
    }

    currentPlayer = currentPlayer.id == 1 ? player2 : player1;

    return;
  }
}
