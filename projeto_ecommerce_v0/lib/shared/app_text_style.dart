import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonLabel = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textSpan = TextStyle(
    color: AppColors.grey600,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle highlightedTextSpan = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle passwordNotValidated = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle passwordValidated = TextStyle(
    color: AppColors.green,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
