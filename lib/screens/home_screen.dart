import 'package:flutter/material.dart';

import '/widgets/app_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const AppLogo(),
          FilledButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(170, 36),
            ),
            child: Text(
              'Play',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
