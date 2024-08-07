import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/models/match.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/match/bloc/match_bloc.dart';

void main() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('matchesbox');
  Hive.registerAdapter(MatchModelAdapter());
  runApp(const MyApp());
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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
