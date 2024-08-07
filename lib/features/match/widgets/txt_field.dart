import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/config/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.title,
    required this.red,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String title;
  final bool red;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff210C0C),
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF',
              ),
            ),
            const SizedBox(width: 6),
            Image.asset(
              'assets/tab1.png',
              height: 25,
              color: red ? AppColors.red : AppColors.green,
            ),
          ],
        ),
        const SizedBox(height: 7),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.matchCard,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: AppColors.black25,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: TextField(
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
              // FilteringTextInputFormatter.digitsOnly,
              // LengthLimitingTextInputFormatter(6),
            ],
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: (value) {
              controller.text = value;
              onChanged();
            },
          ),
        ),
      ],
    );
  }
}
