import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/screens/category_meal_screen.dart';
import 'package:meal/screens/filters.dart';
import 'package:meal/screens/meal_deatil_screen.dart';
import 'package:meal/screens/personal.dart';
import 'package:meal/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MealApp());
}

class MealApp extends StatefulWidget {
  const MealApp({super.key});

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> avMeal =DUMMY_MEALS;
  List<Meal> favMeal =[];
  void setFilters(Map<String, bool> filterData){
    setState(() {
      filters =filterData;
      avMeal = DUMMY_MEALS.where((meal) {
        if(filters['gluten']==true && !meal.isGlutenFree){
          return false;
        }
        if(filters['lactose']==true && !meal.isLactoseFree){
          return false;
        }
        if(filters['vegan']==true && !meal.isVegan){
          return false;
        }
        if(filters['vegetarian']==true && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  void fav (String mealId){
    final exIndex =favMeal.indexWhere((meal) => mealId==meal.id);
    if(exIndex>=0){
      setState(() {
        favMeal.removeAt(exIndex);
      });
    }
    else{
      setState(() {
        favMeal.add(DUMMY_MEALS.firstWhere((meal) => mealId==meal.id));
      });
    }
  }
  bool isFav(String id){
    return favMeal.any((meal) => id==meal.id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => TabsScreen(favMeal),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(avMeal),
        MealDetailScreen.routName: (context) => MealDetailScreen(fav,isFav),
        Personal.elsayed: (context) => const Personal(),
        Filters.filter: (context) => Filters(setFilters,filters)
      },
    );
  }
}
