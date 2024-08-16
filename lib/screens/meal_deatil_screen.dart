import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';


class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen( this.fav,this.isFav, {super.key} );
  final Function fav;
  final Function isFav;

  static const routName = 'meal_detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ),
    );
  }

  Widget bB(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(selectMeal.title),
          ))),
      body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [

        Column(
          children: [
            SizedBox(
              height: 252,
              width: double.infinity,
              child: Image.network(selectMeal.imageUrl),
            ),
            buildSectionTitle(context, 'ingredients'),
            bB(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      selectMeal.ingredients[index],
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            bB(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectMeal.steps[index]),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
                itemCount: selectMeal.steps.length,
              ),
            )
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> fav(mealId),
        child:Icon(
          isFav(mealId)?Icons.favorite:Icons.favorite_border
        ),
      ),
    );
  }
}
