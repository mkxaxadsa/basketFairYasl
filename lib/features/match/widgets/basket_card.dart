import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/basket_model.dart';

class BasketCard extends StatelessWidget {
  const BasketCard({super.key, required this.model});

  final BasketModel model;

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
          context.push('/basket-detail', extra: model);
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
                            model.homeGoals.toString(),
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
                        color: AppColors.red,
                        height: 25,
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        child: Text(
                          model.homeTeamTitle,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'P',
                          ),
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
                            model.awayGoals.toString(),
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
                        color: AppColors.green,
                        height: 25,
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        child: Text(
                          model.awayTeamTitle,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'P',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              model.time,
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
