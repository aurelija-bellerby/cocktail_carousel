import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:cocktail_carousel/drink.dart';
import 'package:cocktail_carousel/main_menu.dart';
import 'package:cocktail_carousel/recipe.dart';
import 'package:cocktail_carousel/search_result.dart';

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
          fontFamily: 'RaleWay',
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(246, 172, 151, 1.0)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Cocktail Carousel'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  Future<Drink>? newDrink;
  Drink? currentDrink;
  String navLocation = 'Main';

  void getDrink() async {
    newDrink = fetchDrink();
    currentDrink = await newDrink;
    navigate('Result');
    notifyListeners();
  }

  void navigate(String location) {
    navLocation = location;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var nav = appState.navLocation;
    final theme = Theme.of(context);

    Widget view;
    switch (nav) {
      case 'Main':
        view = const MainMenu();
      case 'Result':
        view = const SearchResult();
      case 'Recipe':
        view = const Recipe();
      default:
        throw UnimplementedError('no widget available');
    }
    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceVariant,
      body: SafeArea(
        child: Center(
            child: Container(
          child: view,
        )),
      ),
    );
  }
}
