import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/config/app_colors.dart';

class NumberField extends StatefulWidget {
  const NumberField({
    super.key,
    required this.controller,
    required this.title,
    required this.red,
    this.time = false,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String title;
  final bool red;
  final bool time;
  final void Function() onChanged;

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  final timeFormatter = MaskTextInputFormatter(
    mask: '##:##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
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
              color: widget.red ? AppColors.red : AppColors.green,
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
            controller: widget.controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              if (widget.time) ...[
                timeFormatter
              ] else ...[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
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
              widget.controller.text = value;
              widget.onChanged();
            },
          ),
        ),
      ],
    );
  }
}
