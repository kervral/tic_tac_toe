import '../player/player.dart';
import 'tic_tac_toe.interface.dart';

class TicTacToe extends AbstractTicTacToe {
  TicTacToe();

  final Board board =
      List<List<Player?>>.filled(3, List<Player?>.filled(3, null));
  final Player player1 = const Player(1);
  final Player player2 = const Player(2);

  @override
  Player? findWinner() {
    // Check for vertical and horizontal wins
    for (int x = 0; x < board.length - 1; x++) {
      if (board[x][0] != null &&
          board[x][0] == board[x][1] &&
          board[x][0] == board[x][2]) {
        return board[x][0];
      }

      if (board[0][x] != null &&
          board[0][x] == board[1][x] &&
          board[0][x] == board[2][x]) {
        return board[0][x];
      }
    }

    // Check top-left to bottom-right diagonal win
    if (board[0][0] != null &&
        board[1][1] == board[0][0] &&
        board[2][2] == board[0][0]) {
      return board[0][0];
    }

    // Check top-right to bottom-left diagonal win
    if (board[0][2] != null &&
        board[1][1] == board[0][0] &&
        board[2][0] == board[0][0]) {
      return board[0][2];
    }

    return null;
  }

  @override
  bool isBoardFull() {
    for (final List<Player?> row in board) {
      if (row.every((Player? cell) => cell == null)) {
        return false;
      }
    }

    return true;
  }

  @override
  bool isGameOver() {
    if (!isBoardFull()) {
      return false;
    }

    return false;
  }

  @override
  void play(Player player, int x, int y) {
    board[x][y] = player;
  }
}
