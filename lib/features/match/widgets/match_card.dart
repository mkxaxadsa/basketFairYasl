import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 37),
      decoration: BoxDecoration(
        color: AppColors.matchCard,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: AppColors.black25,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/match-detail', extra: match);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 52,
                        child: Center(
                          child: Text(
                            match.score1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'P',
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/tab1.png',
                        height: 25,
                        color: AppColors.red,
                      ),
                      const SizedBox(width: 17),
                      Text(
                        match.name1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'P',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 52,
                        child: Center(
                          child: Text(
                            match.score2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'P',
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/tab1.png',
                        height: 25,
                        color: AppColors.green,
                      ),
                      const SizedBox(width: 17),
                      Text(
                        match.name2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'P',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              match.eventTime,
              style: TextStyle(
                color: AppColors.white50,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'P',
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
