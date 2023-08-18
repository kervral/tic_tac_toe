import '../player/player.dart';
import 'tic_tac_toe.interface.dart';

class TicTacToe extends AbstractTicTacToe {
  TicTacToe();

  Board board = List<List<int>>.filled(3, List<int>.filled(3, 0));
  final Player player1 = const Player(1);
  final Player player2 = const Player(2);

  @override
  Player? findWinner() {
    // TODO: implement findWinner
    throw UnimplementedError();
  }

  @override
  bool isBoardFull() {
    for (final List<int> row in board) {
      if (row.every((int cell) => cell == 0)) {
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
    board[x][y] = player.id;
    if (!isGameOver()) return;
  }
}
