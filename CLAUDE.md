# CLAUDE.md

This file provides guidance for AI assistants working in this repository.

## Project Overview

A cross-platform Tic Tac Toe game built with Flutter/Dart. Targets Android, iOS, Web, Linux, macOS, and Windows.

## Architecture

The codebase follows a layered architecture with clear separation of concerns:

```
lib/
├── main.dart                          # App entry point, theme setup (Google Fonts)
├── screens/                           # Stateful screen widgets
│   ├── home_screen.dart               # Landing screen with start button
│   └── game_screen.dart              # Active game UI and state management
├── domain/                            # Pure business logic (no Flutter dependencies)
│   ├── player/
│   │   └── player.dart               # Player entity (id, icon)
│   └── tic_tac_toe/
│       ├── tic_tac_toe.interface.dart # AbstractTicTacToe contract
│       └── tic_tac_toe.dart          # Game logic implementation
└── widgets/                           # Reusable UI components
    ├── button.dart
    ├── game_board.dart
    └── tic_tac_toe_logo.dart
```

**Key constraint**: The `domain/` layer must remain independent of Flutter UI code — only pure Dart.

## Development Commands

```bash
# Install dependencies
flutter pub get

# Run the app (choose a platform)
flutter run
flutter run -d web
flutter run -d linux

# Run all tests
flutter test

# Static analysis (must pass before committing)
flutter analyze

# Build for distribution
flutter build apk       # Android
flutter build web       # Web
flutter build linux     # Linux desktop
```

## Testing

Tests live in `test/`. Two test files exist:

- `test/tic_tac_toe_test.dart` — unit tests for core game logic (`isBoardFull`, `findWinner`, `play`)
- `test/home_page_test.dart` — widget test for `HomePage` rendering and navigation

When adding features to the domain layer, add corresponding unit tests. Run `flutter test` to verify everything passes.

## CI/CD

CircleCI runs automatically on push (`.circleci/config.yml`):
1. `flutter/lint` — runs `flutter analyze`
2. `flutter/unit_test` — runs `flutter test`

Both must pass. Do not skip or disable these checks.

## Code Conventions

### Naming
- Classes: `PascalCase` (`TicTacToe`, `GameScreen`, `Player`)
- Methods and variables: `camelCase` (`findWinner`, `currentPlayer`)
- Private members: leading underscore (`_buildCells`, `_title`)
- Files: `snake_case` (`tic_tac_toe.dart`, `game_screen.dart`)

### Style
- Enforced by `very_good_analysis` — run `flutter analyze` and fix all warnings before committing
- Always specify types explicitly (no implicit `var` inference where avoidable)
- Prefer `const` constructors and `final` fields wherever possible
- Use relative imports within the package

### Commit Messages
Follow Conventional Commits:
- `feat:` — new feature
- `fix:` — bug fix
- `refactor:` — code restructuring without behavior change
- `docs:` — documentation only

## Key Domain Logic

**`TicTacToe`** (`lib/domain/tic_tac_toe/tic_tac_toe.dart`):
- Board is `List<List<Player?>>` (3×3), initialized to `null`
- `player1` uses a red circle icon; `player2` uses a blue X icon
- `play(row, col)` places the current player's mark and switches turns; no-ops on occupied cells
- `findWinner()` checks rows, columns, and both diagonals; returns the winning `Player` or `null`
- `isBoardFull()` returns `true` when no `null` cells remain
- Starting player is chosen randomly via `chooseStartingPlayer()`

**`AbstractTicTacToe`** (`lib/domain/tic_tac_toe/tic_tac_toe.interface.dart`):
- Defines the public contract. Implement this interface if creating alternative game logic.

## Dependencies

```yaml
dependencies:
  google_fonts: ^5.1.0    # Roboto and Caveat Brush fonts
  cupertino_icons: ^1.0.2 # iOS-style icons

dev_dependencies:
  very_good_analysis: ^5.0.0  # Strict Dart linting rules
```

Keep dependencies minimal. Do not add packages without a clear necessity.
