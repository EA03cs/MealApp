import 'package:flutter/material.dart';
import 'package:meal/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color, {super.key});

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => SelectCategory(context),
        splashColor: Colors.cyanAccent,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.5),
                  color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
