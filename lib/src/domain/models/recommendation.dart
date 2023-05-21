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
}