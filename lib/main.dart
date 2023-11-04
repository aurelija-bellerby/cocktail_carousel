import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Drink {
  final String name;
  final String image;
  final String instructions;
  final String ingredient1;
  // Remaining ingredients may be null, therefore String?
  final String? ingredient2;
  final String? ingredient3;
  final String? ingredient4;
  final String? ingredient5;
  final String? ingredient6;
  final String? ingredient7;
  final String? ingredient8;
  final String? ingredient9;
  final String? ingredient10;
  final String? ingredient11;
  final String? ingredient12;
  final String? ingredient13;
  final String? ingredient14;
  final String? ingredient15;
  final String measure1;
  // Remaining measures may be null (same as for ingredients)
  final String? measure2;
  final String? measure3;
  final String? measure4;
  final String? measure5;
  final String? measure6;
  final String? measure7;
  final String? measure8;
  final String? measure9;
  final String? measure10;
  final String? measure11;
  final String? measure12;
  final String? measure13;
  final String? measure14;
  final String? measure15;

  const Drink({
    required this.name,
    required this.image,
    required this.instructions,
    required this.ingredient1,
    this.ingredient2,
    this.ingredient3,
    this.ingredient4,
    this.ingredient5,
    this.ingredient6,
    this.ingredient7,
    this.ingredient8,
    this.ingredient9,
    this.ingredient10,
    this.ingredient11,
    this.ingredient12,
    this.ingredient13,
    this.ingredient14,
    this.ingredient15,
    required this.measure1,
    this.measure2,
    this.measure3,
    this.measure4,
    this.measure5,
    this.measure6,
    this.measure7,
    this.measure8,
    this.measure9,
    this.measure10,
    this.measure11,
    this.measure12,
    this.measure13,
    this.measure14,
    this.measure15,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    var data = json['drinks'][0];
    return Drink(
        name: data['strDrink'] as String,
        image: data['strDrinkThumb'] as String,
        instructions: data['strInstructions'] as String,
        ingredient1: data['strIngredient1'] as String,
        ingredient2: data['strIngredient2'],
        ingredient3: data['strIngredient3'],
        ingredient4: data['strIngredient4'],
        ingredient5: data['strIngredient5'],
        ingredient6: data['strIngredient6'],
        ingredient7: data['strIngredient7'],
        ingredient8: data['strIngredient8'],
        ingredient9: data['strIngredient9'],
        ingredient10: data['strIngredient10'],
        ingredient11: data['strIngredient11'],
        ingredient12: data['strIngredient12'],
        ingredient13: data['strIngredient13'],
        ingredient14: data['strIngredient14'],
        ingredient15: data['strIngredient15'],
        measure1: data['strMeasure1'] as String,
        measure2: data['strMeasure2'],
        measure3: data['strMeasure3'],
        measure4: data['strMeasure4'],
        measure5: data['strMeasure5'],
        measure6: data['strMeasure6'],
        measure7: data['strMeasure7'],
        measure8: data['strMeasure8'],
        measure9: data['strMeasure9'],
        measure10: data['strMeasure10'],
        measure11: data['strMeasure11'],
        measure12: data['strMeasure12'],
        measure13: data['strMeasure13'],
        measure14: data['strMeasure14'],
        measure15: data['strMeasure15']);
  }
}

// Convert the response body into a JSON Map
Future<Drink> fetchDrink() async {
  final response = await http
      .get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

  // If fetch is successful parse JSON and create drink, otherwise throw an exception
  if (response.statusCode == 200) {
    return Drink.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Oops! Failed to fetch drink');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Cocktail Carousel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  Future<Drink>? currentDrink;

  void getDrink() {
    currentDrink = fetchDrink();
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: MainMenu()),
    );
  }
}

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
          onPressed: appState.getDrink,
          child: const Text("I'd like a drink"),
        ),
      ],
    );
  }
}
