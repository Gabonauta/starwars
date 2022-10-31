import 'package:dio/dio.dart';
import 'package:starwars/Models/models.dart';

class PeopleService {
  final List<Map<String, dynamic>> allcharacters = [];
  List<People> charactersMap = [];
  List<People> searchResult = [];
  int page = 0;
  bool isLoading = true;
  Future<List<People>> loadCharacters() async {
    page++;
    isLoading = true;
    var dio = Dio();

    final url = "https://swapi.dev/api/people/?page=$page";
    final response = await dio.get(url);
    Page alldata = Page.fromMap(response.data);
    charactersMap = [...charactersMap, ...alldata.results];
    isLoading = false;

    print(charactersMap);
    return charactersMap;
  }
}
