import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class WeekdaysWidget extends StatelessWidget {
  const WeekdaysWidget({
    super.key,
    required this.tab,
    required this.onPressed,
  });

  final String tab;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Tab(
          title: 'Mon',
          active: tab == 'Mon',
          onPressed: onPressed,
        ),
        _Tab(
          title: 'Tue',
          active: tab == 'Tue',
          onPressed: onPressed,
        ),
        _Tab(
          title: 'Wed',
          active: tab == 'Wed',
          onPressed: onPressed,
        ),
        _Tab(
          title: 'Thu',
          active: tab == 'Thu',
          onPressed: onPressed,
        ),
        _Tab(
          title: 'Fri',
          active: tab == 'Fri',
          onPressed: onPressed,
        ),
        _Tab(
          title: 'Sat',
          active: tab == 'Sat',
          onPressed: onPressed,
        ),
        _Tab(
          title: 'Sun',
          active: tab == 'Sun',
          onPressed: onPressed,
        ),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          color: active
              ? const Color(0xff702626).withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (active)
              BoxShadow(
                color: AppColors.black25,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: CupertinoButton(
          onPressed: () {
            onPressed(title);
          },
          padding: EdgeInsets.zero,
          minSize: 25,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'P',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
