import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: 'SF',
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.black50,
    selectionColor: AppColors.black25,
    selectionHandleColor: AppColors.black50,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.main, // overscroll indicator color
  ),
);
