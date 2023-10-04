import 'package:flutter/material.dart';

import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'utils/app_routes.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

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
            color: Colors.white,
            
          ),
        ),
      ),
      
      routes: {AppRouters.HOME: (ctx) => TabsScreen(),
                AppRouters.CATEGORIES_MEALS:(ctx) => CategoriesMealsScreen(),
                AppRouters.MEAL_DETAIL:(ctx) => MealDatailScreen(),
                AppRouters.SETTINGS:(ctx) => SettingsScreen(),
                 },
                
    );
  }
}
