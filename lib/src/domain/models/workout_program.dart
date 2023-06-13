import 'package:specifit/src/domain/models/category.dart';

class WorkoutProgram {
  final String id;
  final List<Category> ctgList;
  final String desc;
  final String img;
  final String title;
  final List<List<String>> workouts;
  final DateTime updatedAt;
  final DateTime createdAt;

  WorkoutProgram({
    required this.id,
    required this.ctgList,
    required this.desc,
    required this.img,
    required this.title,
    required this.workouts,
    required this.updatedAt,
    required this.createdAt,
  });

  factory WorkoutProgram.fromJson(Map<String, dynamic> json) => WorkoutProgram(
    id: json["_id"],
    ctgList: List<Category>.from(json["ctgList"].map((x) => Category.fromJson(x))),
    desc: json["desc"],
    img: json["img"],
    title: json["title"],
    workouts: List<List<String>>.from(json["workouts"].map((x) => List<String>.from(x.map((x) => x)))),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ctgList": List<dynamic>.from(ctgList.map((x) => x.toJson())),
    "desc": desc,
    "img": img,
    "title": title,
    "workouts": List<dynamic>.from(workouts.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}