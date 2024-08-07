import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_scaffold.dart';
import '../../match/pages/match_page.dart';
import '../../news/pages/news_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSettings) return const SettingsPage();

              if (state is HomeNews) return const NewsPage();

              return const MatchesPage();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
