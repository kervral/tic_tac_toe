import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/domain/tic_tac_toe/tic_tac_toe.dart';

void main() {
  group('TicTacToe', () {
    group('isBoardFull()', () {
      test('should return false on empty board', () {
        final TicTacToe game = TicTacToe();

        expect(game.isBoardFull(), false);
      });

      test('should return true on full board', () {
        final TicTacToe game = TicTacToe();
        game
          ..play(game.player1, 0, 0)
          ..play(game.player1, 0, 1)
          ..play(game.player1, 0, 2)
          ..play(game.player1, 1, 0)
          ..play(game.player1, 1, 1)
          ..play(game.player1, 1, 2)
          ..play(game.player1, 2, 0)
          ..play(game.player1, 2, 1)
          ..play(game.player1, 2, 2);

        expect(game.isBoardFull(), true);
      });
    });
    group('findWinner()', () {
      test('should return null when nobody wins and no moves has been played',
          () {
        final TicTacToe game = TicTacToe();

        expect(game.findWinner(), null);
      });

      test('should return null when nobody wins and one move has been played',
          () {
        final TicTacToe game = TicTacToe();

        game.play(game.player1, 0, 0);

        expect(game.findWinner(), null);
      });

      test('should return player1 when player1 wins vertically', () {
        final TicTacToe game = TicTacToe();

        game
          ..play(game.player1, 0, 0)
          ..play(game.player1, 1, 0)
          ..play(game.player1, 2, 0);

        expect(game.findWinner(), game.player1);
      });

      test('should return player1 when player1 wins horizontally', () {
        final TicTacToe game = TicTacToe();

        game
          ..play(game.player1, 0, 0)
          ..play(game.player1, 0, 1)
          ..play(game.player1, 0, 2);

        expect(game.findWinner(), game.player1);
      });

      test(
          'should return player1 when player1 wins on the top-left bottom-right diagonal',
          () {
        final TicTacToe game = TicTacToe();

        game
          ..play(game.player1, 0, 0)
          ..play(game.player1, 1, 1)
          ..play(game.player1, 2, 2);

        expect(game.findWinner(), game.player1);
      });

      test(
          'should return player1 when player1 wins on the top-right bottom-left diagonal',
          () {
        final TicTacToe game = TicTacToe();

        game
          ..play(game.player1, 0, 2)
          ..play(game.player1, 1, 1)
          ..play(game.player1, 2, 0);

        expect(game.findWinner(), game.player1);
      });
    });
  });
}
