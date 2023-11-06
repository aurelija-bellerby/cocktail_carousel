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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cocktail \n Carousel',
            ),
            Image.asset(
              'assets/images/logo.png',
              scale: 23,
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
        ElevatedButton(
          onPressed: () {
            appState.navigate('Main');
          },
          child: const Text('Home'),
        ),
      ],
    );
  }
}
