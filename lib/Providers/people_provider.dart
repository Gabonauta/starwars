import 'package:flutter/material.dart';
import 'package:starwars/Services/people_service.dart';

import '../Models/models.dart';

class PeopleProvider extends ChangeNotifier {
  Future<List<People>> people = PeopleService().loadCharacters();
}
