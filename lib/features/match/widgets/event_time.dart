import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match.dart';

class EventTime extends StatelessWidget {
  const EventTime({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        match.eventTime,
        style: const TextStyle(
          color: AppColors.main,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF',
        ),
      ),
    );
  }
}
