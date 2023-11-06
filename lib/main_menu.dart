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
        const SizedBox(height: 300),
        ElevatedButton(
          onPressed: () {
            appState.getDrink();
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 200), shape: const CircleBorder()),
          child: const Text(
            "Tap here for a drink",
            style: TextStyle(
              fontSize: 16,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
