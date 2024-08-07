import 'package:flutter/material.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({
    super.key,
    required this.children,
    required this.padding,
  });

  final List<Widget> children;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      padding: const EdgeInsets.only(right: 10),
      thumbColor: const Color(0xffD9D9D9).withOpacity(0.5),
      radius: const Radius.circular(12),
      thickness: 7,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: padding),
        children: children,
      ),
    );
  }
}
