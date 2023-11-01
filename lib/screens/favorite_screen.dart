import 'package:cardapio/components/meal_item.dart';
import 'package:cardapio/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Minhas Refeicoes Favoritas!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(favoriteMeals[index]);
        }),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
