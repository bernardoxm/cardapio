import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDatailScreen extends StatelessWidget {

final Function(Meal) onToggleFavorite;
final bool Function(Meal) isFavorite;
const MealDatailScreen(this.onToggleFavorite, this.isFavorite);


  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      height: 250,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _createSectionTitle(context, 'Ingredientes'),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                      color: Colors.amber,
                    );
                  },
                ),
              ),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:Theme.of(context).colorScheme.primary,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:Colors.amber,
          child: Icon(isFavorite(meal)? Icons.star: Icons.star_border, color: Colors.black,),
          onPressed: (){onToggleFavorite(meal);},
        ),
        );
  }
}
