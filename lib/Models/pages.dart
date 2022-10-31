// To parse this JSON data, do
//
//     final page = pageFromMap(jsonString);

import 'dart:convert';

import 'package:starwars/Models/people.dart';

class Pagination {
  Pagination({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  String? next;
  String? previous;
  List<People> results;

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        count: json["count"],
        next: json["next"] ?? "9",
        previous: json["previous"] ?? "1",
        results:
            List<People>.from(json["results"].map((x) => People.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

// enum Gender { MALE, N_A, FEMALE }

// final genderValues = EnumValues(
//     {"female": Gender.FEMALE, "male": Gender.MALE, "n/a": Gender.N_A});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
