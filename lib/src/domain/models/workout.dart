// To parse this JSON data, do
//
//     final workout = workoutFromJson(jsonString);

import 'dart:convert';

import 'package:specifit/src/domain/models/category.dart';
import 'package:specifit/src/domain/models/exercise.dart';

Workout workoutFromJson(String str) => Workout.fromJson(json.decode(str));

String workoutToJson(Workout data) => json.encode(data.toJson());

class Workout {
  final String id;
  final List<Category> ctgList;
  final String desc;
  final int est;
  final String img;
  final String title;
  final int totalEst;
  final String vid;
  final List<String> workoutEsts;
  final List<Exercise> workoutLists;
  final int workoutId;
  final DateTime updatedAt;
  final DateTime createdAt;

  Workout({
    required this.id,
    required this.ctgList,
    required this.desc,
    required this.est,
    required this.img,
    required this.title,
    required this.totalEst,
    required this.vid,
    required this.workoutEsts,
    required this.workoutLists,
    required this.workoutId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        id: json["_id"],
        ctgList: List<Category>.from(
            json["ctgList"].map((x) => Category.fromJson(x))),
        desc: json["desc"],
        est: json["est"],
        img: json["img"],
        title: json["title"],
        totalEst: json["totalEst"],
        vid: json["vid"],
        workoutEsts: List<String>.from(json["workoutEsts"].map((x) => x)),
        workoutLists: List<Exercise>.from(
            json["workoutLists"].map((x) => Exercise.fromJson(x))),
        workoutId: json["workoutId"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ctgList": List<dynamic>.from(ctgList.map((x) => x.toJson())),
        "desc": desc,
        "est": est,
        "img": img,
        "title": title,
        "totalEst": totalEst,
        "vid": vid,
        "workoutEsts": List<dynamic>.from(workoutEsts.map((x) => x)),
        "workoutLists": List<dynamic>.from(workoutLists.map((x) => x.toJson())),
        "workoutId": workoutId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
