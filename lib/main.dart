import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return Drink(
        name: json['strDrink'] as String,
        image: json['strDrinkThumb'] as String,
        instructions: json['strInstructions'] as String,
        ingredient1: json['strIngredient1'] as String,
        ingredient2: json['strIngredient2'],
        ingredient3: json['strIngredient3'],
        ingredient4: json['strIngredient4'],
        ingredient5: json['strIngredient5'],
        ingredient6: json['strIngredient6'],
        ingredient7: json['strIngredient7'],
        ingredient8: json['strIngredient8'],
        ingredient9: json['strIngredient9'],
        ingredient10: json['strIngredient10'],
        ingredient11: json['strIngredient11'],
        ingredient12: json['strIngredient12'],
        ingredient13: json['strIngredient13'],
        ingredient14: json['strIngredient14'],
        ingredient15: json['strIngredient15'],
        measure1: json['strMeasure1'] as String,
        measure2: json['strMeasure2'],
        measure3: json['strMeasure3'],
        measure4: json['strMeasure4'],
        measure5: json['strMeasure5'],
        measure6: json['strMeasure6'],
        measure7: json['strMeasure7'],
        measure8: json['strMeasure8'],
        measure9: json['strMeasure9'],
        measure10: json['strMeasure10'],
        measure11: json['strMeasure11'],
        measure12: json['strMeasure12'],
        measure13: json['strMeasure13'],
        measure14: json['strMeasure14'],
        measure15: json['strMeasure15']);
  }
}

// Convert the response body into a JSON Map
Future<Drink> fetchDrink() async {
  final response = await http
      .get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

  // If fetch is successful parse JSON and create dirnk, otherwise throw an exception
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
    return MaterialApp(
      title: 'Cocktail Carousel',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
