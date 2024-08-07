import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match.dart';

class EventName extends StatelessWidget {
  const EventName({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        match.eventName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w500,
          fontFamily: 'P',
          shadows: <Shadow>[
            Shadow(
              color: AppColors.black25,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
