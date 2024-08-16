import 'package:flutter/cupertino.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen(this.favouriteMeal, {super.key});

  final List<Meal> favouriteMeal;

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return const Center(
        child: Text('You have no favourite yet'),
      );
    }
    else{
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            imageUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
            duration: favouriteMeal[index].duration,
            complexity: favouriteMeal[index].complexity,
            affordability: favouriteMeal[index].affordability,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
