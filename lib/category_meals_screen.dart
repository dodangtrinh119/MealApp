import 'package:flutter/material.dart';
import 'package:mealsapp/meal_item.dart';
import './models/category.dart';
import 'dummy_data.dart';
import './models/meal.dart';



class CategoryMealsScreen extends StatelessWidget {
  final Category _category;




  CategoryMealsScreen(this._category);

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(this._category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(_category.title, style: Theme.of(context).textTheme.title,),),
      body: ListView.builder(itemBuilder: (ctx, index) {
        Meal meal = categoryMeals[index];
        return MealItem(meal);



      }, itemCount: categoryMeals.length)
      

    );

  }
}
