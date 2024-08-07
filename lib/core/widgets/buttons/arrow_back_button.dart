import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: CupertinoButton(
        onPressed: () {
          context.pop();
        },
        padding: EdgeInsets.zero,
        minSize: 40,
        child: const Row(
          children: [
            SizedBox(width: 15),
            Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            SizedBox(width: 5),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF',
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
