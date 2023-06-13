class Exercise {
  final String name;
  final int reps;
  final int sets;

  Exercise({
    required this.name,
    required this.reps,
    required this.sets,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    name: json["name"],
    reps: json["reps"],
    sets: json["sets"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "reps": reps,
    "sets": sets,
  };
}