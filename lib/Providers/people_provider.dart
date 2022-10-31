import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Models/models.dart';

class PeopleProvider extends ChangeNotifier {
  PeopleProvider() {
    loadCharacters();
  }
  bool _filterMale = false;
  bool get filter => _filterMale;

  void activateMaleFilter() {
    _filterMale = true;
    notifyListeners();
  }

  void desactivateMaleFilter() {
    _filterMale = false;
    notifyListeners();
  }

  bool _filterFemale = false;
  bool get femaleFilter => _filterFemale;
  void activateFemaleFilter() {
    _filterFemale = true;
    notifyListeners();
  }

  void desactivateFemaleFilter() {
    _filterFemale = false;
    notifyListeners();
  }

  final List<Map<String, dynamic>> allcharacters = [];
  List<People> charactersMap = [];
  List<People> searchResult = [];
  List<People> searchResultFeMale = [];

  int page = 0;

  bool isLoading = false;

  Future<List<People>> loadCharacters() async {
    page++;

    if (page <= 9) {
      var dio = Dio();
      final url = "https://swapi.dev/api/people/?page=$page";
      final response = await dio.get(url);
      Pagination alldata = Pagination.fromMap(response.data);
      charactersMap = [...charactersMap, ...alldata.results];

      notifyListeners();
    }

    return charactersMap;
  }
}
