import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meal/screens/filters.dart';
import 'package:meal/screens/personal.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  void BL(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Personal.elsayed);
  }
  void CC(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Filters.filter);
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'HEY!',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,fontSize: 40),
            ),
          ),
          const Divider(thickness: 4,),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('/'),
            child: const ListTile(
              leading: Icon(Icons.restaurant,size: 26,),
              title: Text(
                'Categories',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,fontSize: 25),
              ),

            ),
          ),
          InkWell(
            onTap: () => CC(context),
            child: const ListTile(
              leading: Icon(Icons.settings,size: 26,),
              title: Text(
                'Filters',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,fontSize: 25),
              ),
             
            ),
          ),
          InkWell(
            onTap: () => BL(context),
            child: const ListTile(
              leading: Icon(Icons.person,size: 26,),
              title: Text(
                'Developer',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
