import '/domain/player/player.dart';

typedef Board = List<List<Player?>>;

abstract class AbstractTicTacToe {
  Player chooseStartingPlayer();
  Player? findWinner();
  bool isBoardFull();
  void play(Player player, int x, int y);
}
