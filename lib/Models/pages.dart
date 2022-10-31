// To parse this JSON data, do
//
//     final page = pageFromMap(jsonString);

import 'dart:convert';

import 'package:starwars/Models/people.dart';

class Page {
  Page({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  int count;
  String next;
  int? previous;
  List<People> results;

  factory Page.fromJson(String str) => Page.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Page.fromMap(Map<String, dynamic> json) => Page(
        count: json["count"],
        next: json["next"],
        previous: json["previous"] ?? 1,
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
