import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars/Presentation/Widgets/card_table.dart';

import '../../Providers/people_provider.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charactersService = Provider.of<PeopleProvider>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  charactersService.activateMaleFilter();
                  charactersService.desactivateFemaleFilter();
                },
                icon: const Icon(Icons.male)),
            IconButton(
                onPressed: () {
                  charactersService.activateFemaleFilter();
                  charactersService.desactivateMaleFilter();
                },
                icon: const Icon(Icons.female)),
            IconButton(
                onPressed: () {
                  charactersService.desactivateFemaleFilter();
                  charactersService.desactivateMaleFilter();
                },
                icon: const Icon(Icons.cancel))
          ],
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
              child: CardTable(
                  character: charactersService.charactersMap,
                  onNextPage: () {
                    charactersService.loadCharacters();
                  }),
            ),
          ],
        ));
  }
}
