import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/tab1.png',
              height: 30,
              color: AppColors.green,
            ),
            const SizedBox(height: 16),
            Text(
              match.name1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
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
          ],
        ),
        const SizedBox(width: 30),
        Text(
          '${match.score1}:${match.score2}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
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
        const SizedBox(width: 30),
        Column(
          children: [
            Image.asset(
              'assets/tab1.png',
              height: 30,
              color: AppColors.red,
            ),
            const SizedBox(height: 16),
            Text(
              match.name2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
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
          ],
        ),
      ],
    );
  }
}
