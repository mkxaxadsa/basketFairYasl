import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black25,
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
    );
  }
}
