import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';

class AddMatchButton extends StatelessWidget {
  const AddMatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 170,
        decoration: BoxDecoration(
          color: const Color(0xff702626),
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
            context.push('/add-match');
          },
          padding: EdgeInsets.zero,
          child: const Center(
            child: Text(
              '+ Matches',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
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
