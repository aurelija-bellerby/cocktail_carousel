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

    Map<String?, String?> contents = {
      drink!.ingredient1: drink.measure1,
      drink.ingredient2: drink.measure2,
      drink.ingredient3: drink.measure3,
      drink.ingredient4: drink.measure4,
      drink.ingredient5: drink.measure5,
      drink.ingredient6: drink.measure6,
      drink.ingredient7: drink.measure7,
      drink.ingredient8: drink.measure8,
      drink.ingredient9: drink.measure9,
      drink.ingredient10: drink.measure10,
      drink.ingredient11: drink.measure11,
      drink.ingredient12: drink.measure12,
      drink.ingredient13: drink.measure13,
      drink.ingredient14: drink.measure14,
      drink.ingredient15: drink.measure15,
    };

    contents.removeWhere((key, value) => key == null && value == null);

    final children = <Widget>[];

    // Creating a Text widget for each map entry
    for (int i = 0; i < contents.length; i++) {
      if (contents.values.elementAt(i) != null) {
        children.add(Text(
            '${contents.values.elementAt(i)} ${contents.keys.elementAt(i)}'
                .replaceAll('  ', ' '))); // ensures no double spaces
      } else {
        // Adding only the ingredient if there is no measure
        children.add(Text('${contents.keys.elementAt(i)}'));
      }
      children.add(const SizedBox(height: 10));
    }

    return ListView(
      padding: const EdgeInsets.only(left: 40, right: 40),
      children: [
        const SizedBox(height: 50),
        DrinkCard(drink: drink),
        const SizedBox(height: 40),
        const Text(
          'Ingredients',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Didot',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
        const SizedBox(height: 20),
        const Text(
          'Instructions',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Didot',
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 15),
        Text(drink.instructions),
        const SizedBox(height: 50),
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
