class Category {
  final List<String> category1;
  final List<String> category2;

  Category({
    required this.category1,
    required this.category2,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    category1: List<String>.from(json["category1"].map((x) => x)),
    category2: List<String>.from(json["category2"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category1": List<dynamic>.from(category1.map((x) => x)),
    "category2": List<dynamic>.from(category2.map((x) => x)),
  };
}