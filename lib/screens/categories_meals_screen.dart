import 'package:cardapio/components/meal_item.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal){return meal.categories.contains(category.id);}).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),centerTitle: true,
      ),
      body: ListView.builder(itemCount: categoryMeals.length, itemBuilder: (ctx, index){return MealItem(categoryMeals[index]);},
      
       ),
     
    );

  }
}
