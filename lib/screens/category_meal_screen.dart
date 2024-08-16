import 'package:flutter/material.dart';
import 'package:meal/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen(this.avMeal, {super.key});

  static const routeName = 'category_screen';
  final List<Meal> avMeal;

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;

  void removeItem(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => mealId == meal.id);
    });
  }

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayedMeals = widget.avMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Center(
                child: Text(
              categoryTitle!,
            )),
          )),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            imageUrl: displayedMeals![index].imageUrl,
            title: displayedMeals![index].title,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
          );
        },
        itemCount: displayedMeals?.length,
      ),
    );
  }
}
