import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars/Providers/cube_provider.dart';

import '../../Models/people.dart';
import '../../Providers/people_provider.dart';

class CardTable extends StatefulWidget {
  final List<People> character;
  final Function onNextPage;
  const CardTable({Key? key, required this.onNextPage, required this.character})
      : super(key: key);

  @override
  State<CardTable> createState() => _CardTableState();
}

class _CardTableState extends State<CardTable> {
  final ScrollController scrollController = ScrollController();
  double translation = 0.0;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        translation = scrollController.position.pixels;
        print(translation);
      });
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 200)) {
        //Todo next page
        translation = scrollController.position.pixels;
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    //Todo dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final charactersService = Provider.of<PeopleProvider>(context);
    final cube = Provider.of<CubeProvider>(context);
    List<People> people = [];
    List<People> peopleFiltered = [];
    List<People> peopleFilteredF = [];

    for (var element in widget.character) {
      if (element.gender == "male" && charactersService.filter) {
        peopleFiltered.add(element);
      } else if (element.gender == "female" && charactersService.femaleFilter) {
        peopleFilteredF.add(element);
      }
    }
    if (charactersService.filter) {
      people = peopleFiltered;
    } else if (charactersService.femaleFilter) {
      people = peopleFilteredF;
    } else {
      people = widget.character;
    }
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      itemCount: people.length,
      itemBuilder: (context, index) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          cube.rotateY(translation);
        });
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _CharacterCard(
            people: people,
            index: index,
          ),
        );
      },
    );
  }
}

class _CharacterCard extends StatelessWidget {
  final List<People> people;
  final int index;

  const _CharacterCard({Key? key, required this.people, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var episode = people[index].films;
    List<String> films = [];
    for (var element in episode) {
      if (element == "https://swapi.dev/api/films/1/") {
        films.add("4");
      } else if (element == "https://swapi.dev/api/films/2/") {
        films.add("5");
      } else if (element == "https://swapi.dev/api/films/3/") {
        films.add("6");
      } else if (element == "https://swapi.dev/api/films/4/") {
        films.add("1");
      } else if (element == "https://swapi.dev/api/films/5/") {
        films.add("2");
      } else {
        films.add("3");
      }
      films.sort();
    }
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(60)),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(people[index].name,
                  style: Theme.of(context).textTheme.titleLarge),
              if (people[index].gender == "n/a")
                const Icon(Icons.android)
              else if (people[index].gender == "female")
                const Icon(Icons.female)
              else
                const Icon(Icons.male),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              Text(
                "Películas",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              Text(
                "Episodio: ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                films.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
