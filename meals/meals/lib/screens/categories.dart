import 'package:flutter/material.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key , required this.onToggleFavourite});
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>  Meals(title:category.title, meals: filteredMeals , onToggleFavourite:onToggleFavourite ,)));
  }
final Function onToggleFavourite;
  @override
  Widget build(context) {
    return 
      GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context , category);
              },
            ),
        ],
    );
  }
}
