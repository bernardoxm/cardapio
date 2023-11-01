import 'package:cardapio/models/settings.dart';
import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  final ThemeData theme = ThemeData();
List<Meal>_availableMeals = DUMMY_MEALS;
List<Meal> _favoriteMeals = [];

void _filterMeals(Settings settings){
setState(() {
  this.settings = settings;
  
  _availableMeals = DUMMY_MEALS.where((meal){
    final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
    final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
    final filterVegan = settings.isVegan && !meal.isVegan;
    final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

    return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;



  }).toList();
});
  
}

void _toggleFavorite(Meal meal){setState(() {
  _favoriteMeals.contains(meal)? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
});}

bool _isFavorite(Meal meal){
  return _favoriteMeals.contains(meal);
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Color.fromRGBO(220, 216, 113, 1),
          
        ),
        textTheme: theme.textTheme.copyWith(
          titleSmall: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            color: const Color.fromARGB(255, 0, 0, 0),
            
          ),
        ),
      ),
      
      routes: {AppRouters.HOME: (ctx) => TabsScreen(_favoriteMeals),
                AppRouters.CATEGORIES_MEALS:(ctx) => CategoriesMealsScreen(_availableMeals),
                AppRouters.MEAL_DETAIL:(ctx) => MealDatailScreen(_toggleFavorite,_isFavorite),
                AppRouters.SETTINGS:(ctx) => SettingsScreen(_filterMeals,settings),
},
                
    );
  }
}
