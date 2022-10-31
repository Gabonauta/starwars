import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/models.dart';
import '../../Providers/people_provider.dart';

class CardTable extends StatefulWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  State<CardTable> createState() => _CardTableState();
}

class _CardTableState extends State<CardTable> {
  @override
  Widget build(BuildContext context) {
    final charactersService = Provider.of<PeopleProvider>(context);

    return FutureBuilder(
      future: charactersService.people,
      builder: (BuildContext context, AsyncSnapshot<List<People>> snapshot) {
        final controller = ScrollController();
        if (snapshot.hasData) {
          return ListView.builder(
            controller: controller,
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            itemBuilder: (context, index) {
              if (index < snapshot.data!.length) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: _CharacterCard(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
            },
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text("Luke Skywalker",
                  style: Theme.of(context).textTheme.titleLarge),
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
          Text(
            "Film1",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Film1",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Film1",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
