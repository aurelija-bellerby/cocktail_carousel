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

    return ListView(
        padding: const EdgeInsets.only(left: 40, right: 40),
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'Cocktail \n  Carousel',
                        style: TextStyle(
                            fontSize: 34,
                            fontFamily: 'Didot',
                            fontWeight: FontWeight.w400,
                            height: 0.7),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    scale: 23,
                  ),
                ],
              ),
              const SizedBox(height: 80),
              DrinkCard(drink: drink),
              const SizedBox(height: 80),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    appState.navigate('Recipe');
                  },
                  child: const Text('view recipe'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    appState.getDrink();
                  },
                  child: const Text('next drink'),
                ),
              ),
            ],
          ),
        ]);
  }
}
