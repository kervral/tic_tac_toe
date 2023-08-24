import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/domain/tic_tac_toe/tic_tac_toe.dart';

void main() {
  group('TicTacToe', () {
    group('isBoardFull()', () {
      test('should return false on empty board', () {
        final TicTacToe game = TicTacToe();

        expect(game.isBoardFull(), false);
      });

      test('should return true when the board is full and nobody wins', () {
        final TicTacToe game = TicTacToe()
          ..play(1, 0)
          ..play(1, 1)
          ..play(1, 2)
          ..play(2, 0)
          ..play(2, 1)
          ..play(2, 2)
          ..play(0, 0)
          ..play(0, 1)
          ..play(0, 2);

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
        final TicTacToe game = TicTacToe()..play(0, 0);

        expect(game.findWinner(), null);
      });

      test('should find a winner when a player wins vertically', () {
        final TicTacToe game = TicTacToe()
          ..play(0, 0)
          ..play(0, 1)
          ..play(1, 0)
          ..play(1, 1)
          ..play(2, 0);

        expect(game.findWinner() != null, true);
      });

      test('should find a winner when a player wins horizontally', () {
        final TicTacToe game = TicTacToe()
          ..play(0, 0)
          ..play(1, 0)
          ..play(0, 1)
          ..play(1, 1)
          ..play(0, 2);

        expect(game.findWinner() != null, true);
      });

      test(
          'should find a winner when a player wins on the top-left bottom-right diagonal',
          () {
        final TicTacToe game = TicTacToe()
          ..play(0, 0)
          ..play(1, 0)
          ..play(1, 1)
          ..play(2, 1)
          ..play(2, 2);

        expect(game.findWinner() != null, true);
      });

      test(
          'should find a winner when a player wins on the top-right bottom-left diagonal',
          () {
        final TicTacToe game = TicTacToe()
          ..play(0, 2)
          ..play(1, 2)
          ..play(1, 1)
          ..play(2, 2)
          ..play(2, 0);

        expect(game.findWinner() != null, true);
      });
    });

    group('play()', () {
      test('should switch current player when a move is made', () {
        final TicTacToe game = TicTacToe();

        final int firstPlayerId = game.currentPlayer.id;

        game.play(0, 0);

        expect(game.currentPlayer.id != firstPlayerId, true);
      });

      test('should not switch player on an already played cell', () {
        final TicTacToe game = TicTacToe()..play(0, 0);

        final int currentPlayerId = game.currentPlayer.id;

        game.play(0, 0);

        expect(game.currentPlayer.id == currentPlayerId, true);
      });

      test('should set the current player instance inside the current cell',
          () {
        final TicTacToe game = TicTacToe();

        final int firstPlayerId = game.currentPlayer.id;

        game.play(0, 0);

        expect(firstPlayerId == game.board[0][0]!.id, true);
      });
    });
  });
}
