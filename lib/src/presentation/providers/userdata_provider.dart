import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:specifit/src/domain/models/userdata.dart';

import '../../domain/models/recommendation.dart';

class UserDataNotifier extends StateNotifier<UserData> {
  UserDataNotifier() : super(UserData.initial());

  void updateUserData(UserData newData) {
    state = newData;
  }

  void calculateIMT() {
    final heightMeter = state.height / 100;
    final imt = state.weight / (heightMeter * heightMeter);

    final updatedData = state.copyWith(imt: imt);

    if (imt > 17 && imt < 18.5) {
      updatedData.imtStatus = "Kurus";
    } else if (imt >= 18.5 && imt <= 25) {
      updatedData.imtStatus = "Normal";
    } else if (imt > 25 && imt <= 27) {
      updatedData.imtStatus = "Gemuk";
    } else if (imt > 27) {
      updatedData.imtStatus = "Obesitas";
    }

    updateUserData(updatedData);
  }

  void calculateCalPerDay() {
    double bmr = 0;
    double tdee = 0;

    if (state.gender == 1) {
      bmr = state.height * 6.25 + state.weight * 9.99 - state.age * 4.92 + 5;
      if (state.activity == 1) {
        tdee = bmr * 1.2;
      } else if (state.activity == 2) {
        tdee = bmr * 1.375;
      } else if (state.activity == 3) {
        tdee = bmr * 1.725;
      } else if (state.activity == 4) {
        tdee = bmr * 1.9;
      }
    } else if (state.gender == 2) {
      bmr = state.height * 6.25 + state.weight * 9.99 - state.age * 4.92 - 161;
      if (state.activity == 1) {
        tdee = bmr * 1.1;
      } else if (state.activity == 2) {
        tdee = bmr * 1.275;
      } else if (state.activity == 3) {
        tdee = bmr * 1.35;
      } else if (state.activity == 4) {
        tdee = bmr * 1.525;
      }
    }

    final updatedData = state.copyWith(
      calPerDayHold: tdee.round(),
      calPerDayLose: (tdee - 500).round(),
    );

    updateUserData(updatedData);
  }

  void calculateRecommendation() {
    List<String> recommendation = [];

    if (state.imtStatus == "Gemuk" || state.imtStatus == "Obesitas") {
      recommendation = ["loseweight", "fatburn", "gemuk"];
    } else if (state.imtStatus == "Kurus") {
      recommendation = ["gainweight", "kurus", "strength"];
    } else if (state.imtStatus == "Normal") {
      recommendation = ["normal", "recommend"];
    }

    final updatedRecommendation = Recommendation(
      agility:
          state.recommendation.agility || recommendation.contains("agility"),
      calist: state.recommendation.calist || recommendation.contains("calist"),
      fatburn:
          state.recommendation.fatburn || recommendation.contains("fatburn"),
      fourteendays: state.recommendation.fourteendays ||
          recommendation.contains("fourteendays"),
      gainweight: state.recommendation.gainweight ||
          recommendation.contains("gainweight"),
      gemuk: state.recommendation.gemuk || recommendation.contains("gemuk"),
      injury: state.recommendation.injury || recommendation.contains("injury"),
      item: state.recommendation.item || recommendation.contains("item"),
      kurus: state.recommendation.kurus || recommendation.contains("kurus"),
      loseweight: state.recommendation.loseweight ||
          recommendation.contains("loseweight"),
      morefourteen: state.recommendation.morefourteen ||
          recommendation.contains("morefourteen"),
      normal: state.recommendation.normal || recommendation.contains("normal"),
      recommend: state.recommendation.recommend ||
          recommendation.contains("recommend"),
      sevendays: state.recommendation.sevendays ||
          recommendation.contains("sevendays"),
      strength:
          state.recommendation.strength || recommendation.contains("strength"),
    );

    final updatedData = state.copyWith(recommendation: updatedRecommendation);

    updateUserData(updatedData);
  }
}

final userDataProvider =
    StateNotifierProvider<UserDataNotifier, UserData>((ref) {
  return UserDataNotifier();
});
