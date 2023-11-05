import 'package:cocktail_carousel/drink_card.dart';
import 'package:cocktail_carousel/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var drink = appState.currentDrink;

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
        DrinkCard(drink: drink),
        ElevatedButton(
          onPressed: () {
            appState.navigate('Recipe');
          },
          child: const Text('View recipe'),
        ),
        ElevatedButton(
          onPressed: () {
            appState.getDrink();
          },
          child: const Text('Next drink'),
        ),
      ],
    );
  }
}
