import '../player/player.dart';

typedef Board = List<List<Player?>>;

abstract class AbstractTicTacToe {
  Player? findWinner();
  bool isBoardFull();
  bool isGameOver();
  void play(Player player, int x, int y);
}
