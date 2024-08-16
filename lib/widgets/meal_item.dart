import 'package:flutter/material.dart';
import 'package:meal/screens/meal_deatil_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id,
        });

  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unKnown';
        break;
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'unKnown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routName, arguments: id)
        .then((result) {
     // if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 200,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [const Icon(Icons.work), Text(complexityText)],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      Text(AffordabilityText)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
