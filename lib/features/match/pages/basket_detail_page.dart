import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/basket_model.dart';
import '../../../core/models/match.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_listview.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/score_card.dart';

class BasketDetailPage extends StatelessWidget {
  const BasketDetailPage({super.key, required this.model});

  final BasketModel model;

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    model.league,
                    textAlign: TextAlign.center,
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
                ),
                if (model.week.isNotEmpty) ...[
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                      child: Text(
                        model.week,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.main,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'P',
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/tab1.png',
                          color: AppColors.red,
                          height: 25,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 100,
                          child: Text(
                            model.homeTeamTitle,
                            textAlign: TextAlign.center,
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
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Text(
                      '${model.homeGoals}:${model.awayGoals}',
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
                          color: AppColors.green,
                          height: 25,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 100,
                          child: Text(
                            model.awayTeamTitle,
                            textAlign: TextAlign.center,
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
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    model.time,
                    style: const TextStyle(
                      color: AppColors.main,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                ScoreCard(
                  delete: false,
                  model: model,
                  match: MatchModel(
                    id: 0,
                    name1: '',
                    name2: '',
                    score1: '',
                    score2: '',
                    eventTime: '',
                    eventName: '',
                    violations1: model.s1,
                    violations2: model.s2,
                    freeThrows1: model.s3,
                    freeThrows2: model.s4,
                    fromCenter1: model.s5,
                    fromCenter2: model.s6,
                    underBasket1: model.s7,
                    underBasket2: model.s8,
                    substitutions1: model.s9,
                    substitutions2: model.s10,
                    injuries1: model.s11,
                    injuries2: model.s12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
