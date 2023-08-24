import 'package:flutter/material.dart';

class TicTacToeLogo extends StatelessWidget {
  const TicTacToeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 4 / 2,
          child: Image.asset('assets/app_icon.png'),
        ),
        Text(
          'Tic Tac Toe',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
