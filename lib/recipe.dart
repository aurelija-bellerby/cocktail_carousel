import 'package:cocktail_carousel/drink_card.dart';
import 'package:cocktail_carousel/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var drink = appState.currentDrink;

    return Column(
      children: [
        DrinkCard(drink: drink),
        ElevatedButton.icon(
          onPressed: () {
            appState.navigate('Result');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          label: const Text('back'),
        ),
      ],
    );
  }
}
