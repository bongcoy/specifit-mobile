class Tip {
  final String id;
  final String title;
  final String author;
  final String article;
  final String img;
  final DateTime updatedAt;
  final DateTime createdAt;

  Tip({
    required this.id,
    required this.title,
    required this.author,
    required this.article,
    required this.img,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
    id: json["_id"],
    title: json["title"],
    author: json["author"],
    article: json["article"],
    img: json["img"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "author": author,
    "article": article,
    "img": img,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}