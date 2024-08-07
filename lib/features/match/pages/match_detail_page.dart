import 'package:flutter/material.dart';

import '../../../core/models/match.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_listview.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/event_name.dart';
import '../widgets/event_time.dart';
import '../widgets/score_card.dart';
import '../widgets/score_widget.dart';

class MatchDetailPage extends StatelessWidget {
  const MatchDetailPage({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Match', back: false, shadow: true),
          const CustomAppbar(''),
          Expanded(
            child: CustomListview(
              padding: 0,
              children: [
                const SizedBox(height: 40),
                EventName(match: match),
                const SizedBox(height: 40),
                ScoreWidget(match: match),
                const SizedBox(height: 12),
                EventTime(match: match),
                const SizedBox(height: 17),
                ScoreCard(match: match),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
