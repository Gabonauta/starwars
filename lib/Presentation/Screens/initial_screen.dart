import 'package:flutter/material.dart';

import 'screens.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Star Wars App',
          style: TextStyle(
            color: Color(0xffFFC947),
          ),
        ),
      ),
      body: PageView(children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://static.wikia.nocookie.net/esstarwars/images/6/6f/Anakin_Skywalker_RotS.png/revision/latest?cb=20160226204939",
              ),
            ),
          ),
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const PeopleScreen(),
                          transitionDuration: const Duration(seconds: 1)),
                    );
                  },
                  child: const Text("Personajes"))),
        ),
        Container(
          color: Colors.red,
          child: const Text("page 2"),
        ),
        Container(
          color: Colors.red,
          child: const Text("page 3"),
        )
      ]),
    );
  }
}
