import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:provider/provider.dart';
import 'package:starwars/Presentation/Widgets/card_table.dart';

import '../../Providers/cube_provider.dart';
import '../../Providers/people_provider.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  @override
  Widget build(BuildContext context) {
    final charactersService = Provider.of<PeopleProvider>(context);
    final cubeService = Provider.of<CubeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: Center(
            child: Cube(
              onSceneCreated: (Scene scene) {
                scene.world.add(
                  Object(
                      fileName: 'assets/objects/cubo.obj',
                      scale: Vector3(7.0, 7.0, 7.0),
                      rotation: Vector3(0.0, cubeService.y, 0.0)),
                );
              },
            ),
          ),
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

class _Cuadrado extends StatefulWidget {
  const _Cuadrado({
    Key? key,
  }) : super(key: key);

  @override
  State<_Cuadrado> createState() => _CuadradoState();
}

class _CuadradoState extends State<_Cuadrado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onListen() {}
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: 90,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: Colors.yellow),
          ),
        );
      },
    );
  }
}
