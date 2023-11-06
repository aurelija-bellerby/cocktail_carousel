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
        const SizedBox(height: 500),
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
