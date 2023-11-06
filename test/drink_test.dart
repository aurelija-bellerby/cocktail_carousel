import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cocktail_carousel/drink.dart';
import 'package:test/test.dart';

void main() {
  test('Can create drink from API', () async {
    Future<Drink> fetchDrink() async {
      final response = await http.get(Uri.parse(
          'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=178364'));

      if (response.statusCode == 200) {
        return Drink.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Oops! Failed to fetch drink');
      }
    }

    const expectedDrink = Drink(
        name: 'Vodka Tonic',
        image:
            'https://www.thecocktaildb.com/images/media/drink/9koz3f1643821062.jpg',
        instructions:
            "Wash and cut 1 wedge and 1 slice of lime or lemon.\r\nFill a tumbler with fresh ice.\r\nPour the desired dose of vodka and top up with the tonic.\r\nSqueeze the lime wedge into the glass and decorate with the slice.\r\nThat's all, very simple: it's just the recipe for happiness!",
        ingredient1: 'Vodka',
        ingredient2: 'Tonic Water',
        ingredient3: 'Lemon Peel',
        measure1: '4 cl',
        measure2: '10 cl',
        measure3: '1 Slice',
        // API held empty strings for measures 4-7
        measure4: '',
        measure5: '',
        measure6: '',
        measure7: '');

    final actualDrink = await fetchDrink();
    expect(actualDrink.name, expectedDrink.name);
    expect(actualDrink.image, expectedDrink.image);
    expect(actualDrink.instructions, expectedDrink.instructions);
    expect(actualDrink.ingredient1, expectedDrink.ingredient1);
    expect(actualDrink.ingredient2, expectedDrink.ingredient2);
    expect(actualDrink.ingredient3, expectedDrink.ingredient3);
    expect(actualDrink.ingredient4, expectedDrink.ingredient4);
    expect(actualDrink.ingredient5, expectedDrink.ingredient5);
    expect(actualDrink.ingredient6, expectedDrink.ingredient6);
    expect(actualDrink.ingredient7, expectedDrink.ingredient7);
    expect(actualDrink.ingredient8, expectedDrink.ingredient8);
    expect(actualDrink.ingredient9, expectedDrink.ingredient9);
    expect(actualDrink.ingredient10, expectedDrink.ingredient10);
    expect(actualDrink.ingredient11, expectedDrink.ingredient11);
    expect(actualDrink.ingredient12, expectedDrink.ingredient12);
    expect(actualDrink.ingredient13, expectedDrink.ingredient13);
    expect(actualDrink.ingredient14, expectedDrink.ingredient14);
    expect(actualDrink.ingredient15, expectedDrink.ingredient15);
    expect(actualDrink.measure1, expectedDrink.measure1);
    expect(actualDrink.measure2, expectedDrink.measure2);
    expect(actualDrink.measure3, expectedDrink.measure3);
    expect(actualDrink.measure4, expectedDrink.measure4);
    expect(actualDrink.measure5, expectedDrink.measure5);
    expect(actualDrink.measure6, expectedDrink.measure6);
    expect(actualDrink.measure7, expectedDrink.measure7);
    expect(actualDrink.measure8, expectedDrink.measure8);
    expect(actualDrink.measure9, expectedDrink.measure9);
    expect(actualDrink.measure10, expectedDrink.measure10);
    expect(actualDrink.measure11, expectedDrink.measure11);
    expect(actualDrink.measure12, expectedDrink.measure12);
    expect(actualDrink.measure13, expectedDrink.measure13);
    expect(actualDrink.measure14, expectedDrink.measure14);
    expect(actualDrink.measure15, expectedDrink.measure15);
  });
}
