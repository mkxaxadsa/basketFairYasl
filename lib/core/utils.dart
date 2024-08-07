import 'dart:convert';
import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/match.dart';

bool onboard = true;
int fetchedDay = 1;
String jsonString = '';
Map<String, dynamic> matchesJson = {};

// SHARED PREFS
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('json_key');
  onboard = prefs.getBool('onboard') ?? true;
  jsonString = prefs.getString('json_key') ?? '';
  fetchedDay = prefs.getInt('fetchedDay') ?? 1;
  if (jsonString.isNotEmpty) matchesJson = jsonDecode(jsonString);
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

// HIVE
List<MatchModel> matchesList = [];

Future<List<MatchModel>> getModels() async {
  final box = await Hive.openBox('matchesbox');
  List data = box.get('matchesList') ?? [];
  matchesList = data.cast<MatchModel>();
  return matchesList;
}

Future<List<MatchModel>> updateModels() async {
  final box = await Hive.openBox('matchesbox');
  box.put('matchesList', matchesList);
  matchesList = await box.get('matchesList');
  return matchesList;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

List<MatchModel> sortedMatches(List<MatchModel> matches, String index) {
  List<MatchModel> sorted = [];
  for (MatchModel match in matches) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(match.id * 1000);
    if (index == 'Mon' && date.weekday == 1) sorted.add(match);
    if (index == 'Tue' && date.weekday == 2) sorted.add(match);
    if (index == 'Wed' && date.weekday == 3) sorted.add(match);
    if (index == 'Thu' && date.weekday == 4) sorted.add(match);
    if (index == 'Fri' && date.weekday == 5) sorted.add(match);
    if (index == 'Sat' && date.weekday == 6) sorted.add(match);
    if (index == 'Sun' && date.weekday == 7) sorted.add(match);
  }
  return sorted;
}

String getCurrentWeekday() {
  DateTime date = DateTime.now();
  if (date.weekday == 1) return 'Mon';
  if (date.weekday == 2) return 'Tue';
  if (date.weekday == 3) return 'Wed';
  if (date.weekday == 4) return 'Thu';
  if (date.weekday == 5) return 'Fri';
  if (date.weekday == 6) return 'Sat';
  if (date.weekday == 7) return 'Sun';
  return 'Mon';
}

String getRandomInt(int max) {
  final random = Random();
  return random.nextInt(max).toString();
}
