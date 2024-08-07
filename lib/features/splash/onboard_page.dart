import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/primary_button.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int pageIndex = 0;

  String bg = 'o1';
  String asset = 'hand';
  String title = 'Hello, User!';
  String subtitle = 'Welcome to the basketball app.';
  double height = 300;

  void onNext() async {
    if (pageIndex == 2) {
      await saveData().then((value) {
        context.go('/home');
      });
    } else {
      pageIndex++;
    }
    setState(() {
      if (pageIndex == 0) {
        bg = 'o1';
        asset = 'hand';
        title = 'Hello, User!';
        subtitle = 'Welcome to the basketball app.';
        height = 300;
      }
      if (pageIndex == 1) {
        bg = 'o2';
        asset = 'ball';
        title = 'Analyze basketball,\nwatch the news ';
        subtitle =
            'Watch the basketball news, stay up\nto date on the latest developments.';
        height = 265;
      }
      if (pageIndex == 2) {
        bg = 'o3';
        asset = 'basket';
        title = 'Watch the basketball\ngames';
        subtitle =
            'Study detailed information on the\nmatches, draw conclusions ';
        height = 265;
      }
    });
  }

  void goPage(int index) {
    pageIndex = index;
    setState(() {
      if (pageIndex == 0) {
        bg = 'o1';
        asset = 'hand';
        title = 'Hello, User!';
        subtitle = 'Welcome to the basketball app.';
        height = 300;
      }
      if (pageIndex == 1) {
        bg = 'o2';
        asset = 'ball';
        title = 'Analyze basketball,\nwatch the news ';
        subtitle =
            'Watch the basketball news, stay up\nto date on the latest developments.';
        height = 265;
      }
      if (pageIndex == 2) {
        bg = 'o3';
        asset = 'basket';
        title = 'Watch the basketball\ngames';
        subtitle =
            'Study detailed information on the\nmatches, draw conclusions ';
        height = 265;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64),
                  topRight: Radius.circular(64),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
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
                        const SizedBox(height: 5),
                        Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 15,
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
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _PageIndicator(
                        active: pageIndex == 0,
                        onPressed: () {
                          goPage(0);
                        },
                      ),
                      const SizedBox(width: 18),
                      _PageIndicator(
                        active: pageIndex == 1,
                        onPressed: () {
                          goPage(1);
                        },
                      ),
                      const SizedBox(width: 18),
                      _PageIndicator(
                        active: pageIndex == 2,
                        onPressed: () {
                          goPage(2);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    title: pageIndex == 2 ? 'Go' : 'Next',
                    onPressed: onNext,
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/$bg.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: pageIndex == 2
                ? 40
                : 60 + MediaQuery.of(context).viewPadding.top,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/$asset.png',
                  height: 300,
                ),
                if (pageIndex == 2) ...[
                  const Text(
                    '10:12',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 62,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.active,
    required this.onPressed,
  });

  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 27,
      child: Container(
        height: 7,
        width: 51,
        decoration: BoxDecoration(
          color: active ? Colors.black : Colors.black.withOpacity(0.5),
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
    );
  }
}
