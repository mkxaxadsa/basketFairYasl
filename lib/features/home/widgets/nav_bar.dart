import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80,
        color: AppColors.main,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  title: 'Matches',
                  asset: 'tab1',
                  active: state is HomeInitial,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  title: 'News',
                  asset: 'tab2',
                  active: state is HomeNews,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                _NavBarButton(
                  title: 'Settings',
                  asset: 'tab3',
                  active: state is HomeSettings,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 2));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.title,
    required this.asset,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: 62,
        height: 80,
        child: Column(
          children: [
            const Spacer(),
            if (asset == 'tab1')
              Image.asset(
                'assets/tab1.png',
                height: 30,
                color: active ? Colors.white : AppColors.white50,
              )
            else
              SvgPicture.asset(
                'assets/$asset.svg',
                color: active ? Colors.white : AppColors.white50,
              ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: active ? Colors.white : AppColors.white50,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                fontFamily: 'P',
              ),
            ),
            const Spacer(),
            Container(
              height: 3,
              decoration: BoxDecoration(
                color: active ? AppColors.navBarIndicator : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
