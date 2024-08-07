import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/basket_model.dart';
import '../../../core/models/match.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../bloc/match_bloc.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    super.key,
    required this.match,
    this.model,
    this.delete = true,
  });

  final MatchModel match;
  final BasketModel? model;
  final bool delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffCB6100).withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(64),
          topRight: Radius.circular(64),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const _StatisticsText(),
          if (!delete && model != null) ...[
            const SizedBox(height: 30),
            _PercentStatistics(
              title: 'Win',
              percent1: int.parse(model!.p1),
              percent2: int.parse(model!.p2),
            ),
            const SizedBox(height: 30),
            _PercentStatistics(
              title: 'Attacks',
              percent1: int.parse(model!.p3),
              percent2: int.parse(model!.p4),
            ),
            const SizedBox(height: 30),
            _PercentStatistics(
              title: 'Shooting',
              percent1: int.parse(model!.p5),
              percent2: int.parse(model!.p6),
            ),
            const SizedBox(height: 30),
            _PercentStatistics(
              title: 'Passing',
              percent1: int.parse(model!.p7),
              percent2: int.parse(model!.p8),
            ),
          ],
          const SizedBox(height: 40),
          _StatisticsData(
            title: 'Violations',
            data1: match.violations1,
            data2: match.violations2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Free throws',
            data1: match.freeThrows1,
            data2: match.freeThrows2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Shots from the center of the field',
            data1: match.fromCenter1,
            data2: match.fromCenter2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Shots under the basket',
            data1: match.underBasket1,
            data2: match.underBasket2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Player substitutions',
            data1: match.substitutions1,
            data2: match.substitutions2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Injuries',
            data1: match.injuries1,
            data2: match.injuries2,
          ),
          const SizedBox(height: 40),
          if (delete)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: PrimaryButton(
                title: 'Delete',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        title: 'Delete?',
                        onYes: () {
                          context
                              .read<MatchBloc>()
                              .add(DeleteMatchEvent(id: match.id));
                          context.pop();
                        },
                      );
                    },
                  );
                },
              ),
            ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _PercentStatistics extends StatelessWidget {
  const _PercentStatistics({
    required this.title,
    required this.percent1,
    required this.percent2,
  });

  final String title;
  final int percent1;
  final int percent2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 12,
              width: 127,
              decoration: BoxDecoration(
                color: const Color(0xffd2a276),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black25,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            Container(
              height: 12,
              width: (127 * percent1) / 100,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black25,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
              width: percent1 > 30 ? (127 * percent1) / 100 : 30,
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    '$percent1%',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'P',
                    ),
                  ),
                  const SizedBox(width: 7),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 70,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
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
        ),
        Stack(
          children: [
            Container(
              height: 12,
              width: 127,
              decoration: BoxDecoration(
                color: const Color(0xffd2a276),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black25,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            Container(
              height: 12,
              width: (127 * percent2) / 100,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black25,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
              width: percent2 > 30 ? (127 * percent2) / 100 : 30,
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    '$percent2%',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'P',
                    ),
                  ),
                  const SizedBox(width: 7),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatisticsText extends StatelessWidget {
  const _StatisticsText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Statistics',
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
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
    );
  }
}

class _StatisticsData extends StatelessWidget {
  const _StatisticsData({
    required this.title,
    required this.data1,
    required this.data2,
  });

  final String title;
  final String data1;
  final String data2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF',
            shadows: <Shadow>[
              Shadow(
                color: AppColors.black25,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
        Text(
          '$data1:$data2',
          style: TextStyle(
            color: const Color(0xff702626),
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF',
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
    );
  }
}
