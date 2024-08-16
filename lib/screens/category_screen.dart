import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (data) => CategoryItem(data.id, data.title, data.color),
            )
            .toList(),
      ),
    );
  }
}
