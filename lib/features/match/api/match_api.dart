import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/basket_model.dart';
import '../../../core/utils.dart';

class MatchApi {
  final String apiKey = 'aad567230b15af533a80bf5aa13a14cb';
  final String apiHost = 'v1.basketball.api-sports.io';
  final String endpoint = 'games';

  final dio = Dio();

  Future<List<BasketModel>> fetchMatches() async {
    final prefs = await SharedPreferences.getInstance();

    if (jsonString.isNotEmpty && fetchedDay == DateTime.now().day) {
      log('JSON IS NOT EMPTY');
      log('FETCHED DAY = $fetchedDay NOW = ${DateTime.now().day}');
      final List result = matchesJson['response'];
      final data = result.map((item) {
        return BasketModel.fromJson(item);
      }).toList();
      return data;
    }
    log('JSON IS EMPTY');
    try {
      int now = DateTime.now().day;
      final response = await dio.get(
        'https://v1.basketball.api-sports.io/games?date=2024-08-${now.toString().padLeft(2, '0')}',
        options: Options(
          headers: {
            'x-rapidapi-host': apiHost,
            'x-rapidapi-key': apiKey,
          },
        ),
      );
      if (response.statusCode == 200) {
        final List result = response.data['response'];

        String jsonString = jsonEncode(response.data);
        await prefs.setString('json_key', jsonString);
        await prefs.setInt('fetchedDay', now);

        log(result.length.toString());
        final data = result.map((item) {
          return BasketModel.fromJson(item);
        }).toList();

        return data;
      } else {
        log('ELSE');
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
