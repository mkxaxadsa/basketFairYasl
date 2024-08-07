import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_listview.dart';
import '../bloc/match_bloc.dart';
import '../widgets/add_match_button.dart';
import '../widgets/basket_card.dart';
import '../widgets/empty_text.dart';
import '../widgets/match_card.dart';
import '../widgets/weekdays_widget.dart';
import '../widgets/your_team_text.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  String tab = getCurrentWeekday();

  void onTab(String value) {
    setState(() {
      tab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar('Matches', back: false, shadow: true),
        Expanded(
          child: CustomListview(
            padding: 25,
            children: [
              const SizedBox(height: 10),
              WeekdaysWidget(
                tab: tab,
                onPressed: onTab,
              ),
              const SizedBox(height: 30),
              BlocBuilder<MatchBloc, MatchState>(
                builder: (context, state) {
                  if (state is MatchesLoadedState) {
                    if (state.games.isEmpty) {
                      return const EmptyText();
                    }

                    return Column(
                      children: [
                        ...List.generate(
                          state.games.length,
                          (index) {
                            return BasketCard(
                              model: state.games[index],
                            );
                          },
                        ),
                      ],
                    );
                  }

                  return Container();
                },
              ),
              const SizedBox(height: 20),
              const YourTeamText(),
              const SizedBox(height: 16),
              WeekdaysWidget(
                tab: tab,
                onPressed: onTab,
              ),
              const SizedBox(height: 30),
              BlocBuilder<MatchBloc, MatchState>(
                builder: (context, state) {
                  if (state is MatchesLoadedState) {
                    if (sortedMatches(state.matches, tab).isEmpty) {
                      return const EmptyText();
                    }

                    return Column(
                      children: [
                        ...List.generate(
                          sortedMatches(state.matches, tab).length,
                          (index) {
                            return MatchCard(
                              match: sortedMatches(state.matches, tab)[index],
                            );
                          },
                        ),
                      ],
                    );
                  }

                  return Container();
                },
              ),
              const AddMatchButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
