// To parse this JSON data, do
//
//     final loggedInUser = loggedInUserFromJson(jsonString);

import 'dart:convert';

LoggedInUser loggedInUserFromJson(String str) => LoggedInUser.fromJson(json.decode(str));

String loggedInUserToJson(LoggedInUser data) => json.encode(data.toJson());


class LoggedInUser {
  final String id;
  final String name;
  final String email;
  final String phone;
  final int role;
  final DateTime updatedAt;
  final DateTime createdAt;

  LoggedInUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
  });

  factory LoggedInUser.fromJson(Map<String, dynamic> json) => LoggedInUser(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    role: json["role"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "role": role,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}