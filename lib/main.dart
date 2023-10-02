import 'package:flutter/material.dart';

import 'screens/categories_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
          
        ),canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: theme.textTheme.copyWith(
          titleSmall: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            color: Colors.white,
            
          ),
        ),
      ),
      
      routes: {AppRouter.HOME: (ctx) => CategoriesScreen(),
                AppRouter.CATEGORIES_MEALS:(ctx) => CategoriesMealsScreen() },
    );
  }
}
