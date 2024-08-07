import 'package:flutter/material.dart';

class YourTeamText extends StatelessWidget {
  const YourTeamText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Your Team',
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'P',
      ),
    );
  }
}
