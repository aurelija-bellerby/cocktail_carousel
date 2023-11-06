import 'package:cocktail_carousel/drink.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({
    super.key,
    required this.drink,
  });

  final Drink? drink;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          drink!.name,
          style: const TextStyle(
            fontFamily: 'Didot',
            fontSize: 26,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.double,
          ),
        ),
        const SizedBox(height: 30),
        Image(image: NetworkImage(drink!.image), width: 300),
      ],
    );
  }
}
