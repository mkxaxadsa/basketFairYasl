import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).viewPadding.top,
            color: AppColors.bg,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(color: AppColors.bg),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
