import 'package:flutter/material.dart';
import 'package:meal/screens/category_screen.dart';
import 'package:meal/screens/favourite_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
   const TabsScreen(this.favouriteMeal, {super.key});

  final List<Meal> favouriteMeal;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> page;
  int _selectedpageindex = 0;

  @override
  void initState() {
    page = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(widget.favouriteMeal),
        'title': 'Favourites'
      },
    ];
    super.initState();
  }

  void selectpage(int value) {
    setState(() {
      _selectedpageindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(page[_selectedpageindex]['title'] as String),
          ))),
      body: page[_selectedpageindex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        elevation: 4,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedpageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
