import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/match.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_listview.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/match_bloc.dart';
import '../widgets/number_field.dart';

class AddScorePage extends StatefulWidget {
  const AddScorePage({super.key, required this.match});

  final MatchModel match;

  @override
  State<AddScorePage> createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();
  final controller8 = TextEditingController();
  final controller9 = TextEditingController();
  final controller10 = TextEditingController();
  final controller11 = TextEditingController();
  final controller12 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else if (controller3.text.isEmpty) {
        active = false;
      } else if (controller4.text.isEmpty) {
        active = false;
      } else if (controller5.text.isEmpty) {
        active = false;
      } else if (controller6.text.isEmpty) {
        active = false;
      } else if (controller7.text.isEmpty) {
        active = false;
      } else if (controller8.text.isEmpty) {
        active = false;
      } else if (controller9.text.isEmpty) {
        active = false;
      } else if (controller10.text.isEmpty) {
        active = false;
      } else if (controller11.text.isEmpty) {
        active = false;
      } else if (controller12.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onNext() {
    context.read<MatchBloc>().add(AddMatchEvent(
          match: MatchModel(
            id: widget.match.id,
            name1: widget.match.name1,
            name2: widget.match.name2,
            score1: widget.match.score1,
            score2: widget.match.score2,
            eventTime: widget.match.eventTime,
            eventName: widget.match.eventName,
            violations1: controller1.text,
            violations2: controller2.text,
            freeThrows1: controller3.text,
            freeThrows2: controller4.text,
            fromCenter1: controller5.text,
            fromCenter2: controller6.text,
            underBasket1: controller7.text,
            underBasket2: controller8.text,
            substitutions1: controller9.text,
            substitutions2: controller10.text,
            injuries1: controller11.text,
            injuries2: controller12.text,
          ),
        ));
    context.pop();
    context.pop();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    controller9.dispose();
    controller10.dispose();
    controller11.dispose();
    controller12.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Create Statistics', back: false, shadow: true),
          const CustomAppbar(''),
          Expanded(
            child: CustomListview(
              padding: 30,
              children: [
                const SizedBox(height: 14),
                NumberField(
                  controller: controller1,
                  title: 'Violations',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                NumberField(
                  controller: controller2,
                  title: 'Violations',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 36),
                NumberField(
                  controller: controller3,
                  title: 'Free throws',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                NumberField(
                  controller: controller4,
                  title: 'Free throws',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 36),
                NumberField(
                  controller: controller5,
                  title: 'Shots from the center of the field',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                NumberField(
                  controller: controller6,
                  title: 'Shots from the center of the field',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 36),
                NumberField(
                  controller: controller7,
                  title: 'Shots under the basket',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                NumberField(
                  controller: controller8,
                  title: 'Shots under the basket',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 36),
                NumberField(
                  controller: controller9,
                  title: 'Player substitutions',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                NumberField(
                  controller: controller10,
                  title: 'Player substitutions',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 36),
                NumberField(
                  controller: controller11,
                  title: 'Injuries',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                NumberField(
                  controller: controller12,
                  title: 'Injuries',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  title: 'Next',
                  // active: active,
                  onPressed: onNext,
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
