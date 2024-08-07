import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class BorderWidget extends StatelessWidget {
  const BorderWidget({super.key, this.padding = 0});

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      margin: EdgeInsets.symmetric(horizontal: padding),
      color: AppColors.border,
    );
  }
}
