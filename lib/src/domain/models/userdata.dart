import 'package:specifit/src/domain/models/recommendation.dart';

class UserData {
  int activity;
  int age;
  int calPerDayHold;
  int calPerDayLose;
  int gender;
  int height;
  double imt;
  String imtStatus;
  bool isFilled;
  int medicalCondition;
  Recommendation recommendation;
  int weight;

  UserData({
    required this.activity,
    required this.age,
    required this.calPerDayHold,
    required this.calPerDayLose,
    required this.gender,
    required this.height,
    required this.imt,
    required this.imtStatus,
    required this.isFilled,
    required this.medicalCondition,
    required this.recommendation,
    required this.weight,
  });

  factory UserData.initial() {
    return UserData(
      activity: 0,
      age: 0,
      calPerDayHold: 0,
      calPerDayLose: 0,
      gender: 0,
      height: 0,
      imt: 0,
      imtStatus: "",
      isFilled: false,
      medicalCondition: 0,
      recommendation: Recommendation.initial(),
      weight: 0,
    );
  }

  UserData copyWith({
    int? activity,
    int? age,
    int? calPerDayHold,
    int? calPerDayLose,
    int? gender,
    int? height,
    double? imt,
    String? imtStatus,
    bool? isFilled,
    int? medicalCondition,
    Recommendation? recommendation,
    int? weight,
  }) {
    return UserData(
      activity: activity ?? this.activity,
      age: age ?? this.age,
      calPerDayHold: calPerDayHold ?? this.calPerDayHold,
      calPerDayLose: calPerDayLose ?? this.calPerDayLose,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      imt: imt ?? this.imt,
      imtStatus: imtStatus ?? this.imtStatus,
      isFilled: isFilled ?? this.isFilled,
      medicalCondition: medicalCondition ?? this.medicalCondition,
      recommendation: recommendation ?? this.recommendation,
      weight: weight ?? this.weight,
    );
  }

  @override
  String toString() {
    return 'UserData(activity: $activity, age: $age, calPerDayHold: $calPerDayHold, calPerDayLose: $calPerDayLose, '
        'gender: $gender, height: $height, imt: $imt, imtStatus: $imtStatus, isFilled: $isFilled, '
        'medicalCondition: $medicalCondition, recommendation: $recommendation, weight: $weight)';
  }
}

