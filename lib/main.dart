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
  final ThemeData theme = ThemeData();
List<Meal>_availableMeals = DUMMY_MEALS;


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
      
      routes: {AppRouters.HOME: (ctx) => TabsScreen(),
                AppRouters.CATEGORIES_MEALS:(ctx) => CategoriesMealsScreen(_availableMeals),
                AppRouters.MEAL_DETAIL:(ctx) => MealDatailScreen(),
                AppRouters.SETTINGS:(ctx) => SettingsScreen(),
},
                
    );
  }
}
