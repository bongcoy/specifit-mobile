class Recommendation {
  bool agility;
  bool calist;
  bool fatburn;
  bool fourteendays;
  bool gainweight;
  bool gemuk;
  bool injury;
  bool item;
  bool kurus;
  bool loseweight;
  bool morefourteen;
  bool normal;
  bool recommend;
  bool sevendays;
  bool strength;

  Recommendation({
    required this.agility,
    required this.calist,
    required this.fatburn,
    required this.fourteendays,
    required this.gainweight,
    required this.gemuk,
    required this.injury,
    required this.item,
    required this.kurus,
    required this.loseweight,
    required this.morefourteen,
    required this.normal,
    required this.recommend,
    required this.sevendays,
    required this.strength,
  });

  factory Recommendation.initial() {
    return Recommendation(
      agility: false,
      calist: false,
      fatburn: false,
      fourteendays: false,
      gainweight: false,
      gemuk: false,
      injury: false,
      item: false,
      kurus: false,
      loseweight: false,
      morefourteen: false,
      normal: false,
      recommend: false,
      sevendays: false,
      strength: false,
    );
  }

  factory Recommendation.fromJson(List<dynamic> json) {
    final recommendation = json.first;

    return Recommendation(
      agility: recommendation['agility'],
      calist: recommendation['calist'],
      fatburn: recommendation['fatburn'],
      fourteendays: recommendation['fourteendays'],
      gainweight: recommendation['gainweight'],
      gemuk: recommendation['gemuk'],
      injury: recommendation['injury'],
      item: recommendation['item'],
      kurus: recommendation['kurus'],
      loseweight: recommendation['loseweight'],
      morefourteen: recommendation['morefourteen'],
      normal: recommendation['normal'],
      recommend: recommendation['recommend'],
      sevendays: recommendation['sevendays'],
      strength: recommendation['strength'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'agility': agility,
      'calist': calist,
      'fatburn': fatburn,
      'fourteendays': fourteendays,
      'gainweight': gainweight,
      'gemuk': gemuk,
      'injury': injury,
      'item': item,
      'kurus': kurus,
      'loseweight': loseweight,
      'morefourteen': morefourteen,
      'normal': normal,
      'recommend': recommend,
      'sevendays': sevendays,
      'strength': strength,
    };
  }
}
