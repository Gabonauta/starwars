import 'package:flutter/material.dart';
import 'package:starwars/Presentation/Widgets/card_table.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Personajes"),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.pixelstalk.net/wp-content/uploads/images5/Aesthetic-Star-Wars-Wallpaper-for-iPhone.jpg"))),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
              ),
            ),
            const CardTable(),
          ],
        ));
  }
}
