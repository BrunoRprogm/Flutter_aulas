import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleProduct = TextStyle(
    color: AppColors.black,
    fontSize: 20,
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

  static const TextStyle productName = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle priceProduct = TextStyle(
    color: Color.fromARGB(255, 31, 124, 34),
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle smallBlack = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle smallGrey = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.grey600,
  );

  static TextStyle smallGreen = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );
}
