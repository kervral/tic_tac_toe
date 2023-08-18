import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/domain/tic_tac_toe/tic_tac_toe.dart';

void main() {
  group('TicTacToe', () {
    test('isBoardFull should return false on empty board', () {
      final TicTacToe game = TicTacToe();

      expect(game.isBoardFull(), false);
    });

    test('isBoardFull should return true on full board', () {
      final TicTacToe game = TicTacToe();

      game.board = List<List<int>>.filled(3, List<int>.filled(3, 1));

      expect(game.isBoardFull(), true);
    });
  });
}
