import 'package:flutter/material.dart';

import '/widgets/logo.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const AppLogo(),
          const SizedBox(height: 300),
          FilledButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(170, 36),
            ),
            child: const Text('Play'),
          ),
        ],
      ),
    );
  }
}
