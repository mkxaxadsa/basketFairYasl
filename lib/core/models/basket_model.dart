import 'package:basket_test/core/utils.dart';

class BasketModel {
  final String homeTeamTitle;
  final String homeTeamLogo;
  final String awayTeamTitle;
  final String awayTeamLogo;
  final int homeGoals;
  final int awayGoals;
  final String time;
  final String week;
  final String league;
  final String s1;
  final String s2;
  final String s3;
  final String s4;
  final String s5;
  final String s6;
  final String s7;
  final String s8;
  final String s9;
  final String s10;
  final String s11;
  final String s12;
  final String p1;
  final String p2;
  final String p3;
  final String p4;
  final String p5;
  final String p6;
  final String p7;
  final String p8;

  const BasketModel({
    required this.homeTeamTitle,
    required this.homeTeamLogo,
    required this.awayTeamTitle,
    required this.awayTeamLogo,
    required this.homeGoals,
    required this.awayGoals,
    required this.time,
    required this.week,
    required this.league,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s7,
    required this.s8,
    required this.s9,
    required this.s10,
    required this.s11,
    required this.s12,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
    required this.p5,
    required this.p6,
    required this.p7,
    required this.p8,
  });

  factory BasketModel.fromJson(Map<String, dynamic> json) => BasketModel(
        homeTeamTitle: json['teams']['home']['name'] ?? '',
        homeTeamLogo: json['teams']['home']['logo'] ?? '',
        awayTeamTitle: json['teams']['away']['name'] ?? '',
        awayTeamLogo: json['teams']['away']['logo'] ?? '',
        homeGoals: json['scores']['home']['total'] ?? 0,
        awayGoals: json['scores']['away']['total'] ?? 0,
        time: json['time'] ?? '',
        week: json['week'] ?? '',
        league: json['league']['name'] ?? '',
        s1: getRandomInt(10),
        s2: getRandomInt(10),
        s3: getRandomInt(10),
        s4: getRandomInt(10),
        s5: getRandomInt(10),
        s6: getRandomInt(10),
        s7: getRandomInt(10),
        s8: getRandomInt(10),
        s9: getRandomInt(10),
        s10: getRandomInt(10),
        s11: getRandomInt(10),
        s12: getRandomInt(10),
        p1: getRandomInt(100),
        p2: getRandomInt(100),
        p3: getRandomInt(50),
        p4: getRandomInt(50),
        p5: getRandomInt(50),
        p6: getRandomInt(50),
        p7: getRandomInt(50),
        p8: getRandomInt(50),
      );
}
