import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2,
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
