import 'dart:convert';
import 'dart:developer';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:basket_test/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/basket_model.dart';
import '../../../core/utils.dart';

class MainScreen extends StatefulWidget {
  final String jdnkasdnkja;
  final String mjksdfn;
  final String data;
  final String c1;
  final String c2;

  const MainScreen(
      {super.key,
      required this.jdnkasdnkja,
      required this.mjksdfn,
      required this.data,
      required this.c1,
      required this.c2});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AppsflyerSdk _appsflyerSdk;
  String idAdv = '';
  String parmFl = '';
  String paramsSecond = '';
  Map _deepLinkData = {};
  Map _gcd = {};
  bool _isFirstLaunch = false;
  String _aStats = '';

  String mxasd = '';
  String rfsdfdsfs = '';

  @override
  Widget build(BuildContext context) {
    final String fsdfdsfds =
        '${widget.jdnkasdnkja}${widget.mjksdfn}$fsdfds${widget.c1}${widget.c2}';
    print(fsdfdsfds);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(fsdfdsfds),
          ),
        ),
      ),
    );
  }
}

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
