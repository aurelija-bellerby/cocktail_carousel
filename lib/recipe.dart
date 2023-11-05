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
    Map<String, String> contents = {drink!.measure1: drink.ingredient1};

    if (drink.measure2 != null && drink.ingredient2 != null) {
      contents[drink.measure2!] = drink.ingredient2!;
    }

    if (drink.measure3 != null && drink.ingredient3 != null) {
      contents[drink.measure3!] = drink.ingredient3!;
    }

    if (drink.measure4 != null && drink.ingredient4 != null) {
      contents[drink.measure4!] = drink.ingredient4!;
    }

    if (drink.measure5 != null && drink.ingredient5 != null) {
      contents[drink.measure5!] = drink.ingredient5!;
    }

    if (drink.measure6 != null && drink.ingredient6 != null) {
      contents[drink.measure6!] = drink.ingredient6!;
    }

    if (drink.measure7 != null && drink.ingredient7 != null) {
      contents[drink.measure7!] = drink.ingredient7!;
    }

    if (drink.measure8 != null && drink.ingredient8 != null) {
      contents[drink.measure8!] = drink.ingredient8!;
    }

    if (drink.measure9 != null && drink.ingredient9 != null) {
      contents[drink.measure9!] = drink.ingredient9!;
    }

    if (drink.measure10 != null && drink.ingredient10 != null) {
      contents[drink.measure10!] = drink.ingredient10!;
    }

    if (drink.measure11 != null && drink.ingredient11 != null) {
      contents[drink.measure11!] = drink.ingredient11!;
    }

    if (drink.measure12 != null && drink.ingredient12 != null) {
      contents[drink.measure12!] = drink.ingredient12!;
    }

    if (drink.measure13 != null && drink.ingredient13 != null) {
      contents[drink.measure13!] = drink.ingredient13!;
    }

    if (drink.measure14 != null && drink.ingredient14 != null) {
      contents[drink.measure14!] = drink.ingredient14!;
    }

    if (drink.measure15 != null && drink.ingredient15 != null) {
      contents[drink.measure15!] = drink.ingredient15!;
    }

    final children = <Widget>[];

    for (int i = 0; i < contents.length; i++) {
      children.add(Text(
          '${contents.keys.elementAt(i)} ${contents.values.elementAt(i)}'));
    }

    return Column(
      children: [
        DrinkCard(drink: drink),
        const Text('Ingredients'),
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: children,
        ),
        const Text('Instructions'),
        Text(drink.instructions),
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
