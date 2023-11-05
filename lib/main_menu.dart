import 'package:cocktail_carousel/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cocktail Carousel',
            ),
            Text(
              'LOGO',
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            appState.getDrink();
          },
          child: const Text("I'd like a drink"),
        ),
      ],
    );
  }
}
