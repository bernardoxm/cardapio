import 'package:cardapio/models/meal.dart';
import 'package:cardapio/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late final List<Map<String, Object>> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String,
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).colorScheme.primary,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favoritos',
            ),
          ]),
    );
  }
}
