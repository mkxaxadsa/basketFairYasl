import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '#Empty',
          style: TextStyle(
            color: AppColors.black50,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'P',
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
