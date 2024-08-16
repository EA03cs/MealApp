import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  static const elsayed = 'personal_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF274460),
        title: const Text('Personal Information',style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),),
      ),
      backgroundColor: const Color(0xFF274460),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/photo_2023-08-08_03-56-36.jpg'),
          ),
          const Text(
            'Elsayed Atef',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Flutter Developer',
            style: TextStyle(
              color: Color(0xFF6c8090),
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: const Row(children: [
                Icon(
                  Icons.phone,
                  size: 32,
                  color: Color(0xFF274460),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  '+201023888997',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: const Row(children: [
                Icon(
                  Icons.email,
                  size: 32,
                  color: Color(0xFF274460),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  'ElsayedAtef469@gmail.com',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
