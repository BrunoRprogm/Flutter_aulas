import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';

enum ButtonType { filled, outlined }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.type,
    this.isLoading = false,
    required this.label,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool isLoading;

  ButtonStyle _getStyle() {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyle.buttonLabel,
          minimumSize: Size.fromHeight(40),
        );
      case ButtonType.outlined:
        return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          textStyle: AppTextStyle.buttonLabel,
          minimumSize: Size.fromHeight(40),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getStyle(),
      child: isLoading
          ? Padding(
              padding: const EdgeInsetsGeometry.all(8.0),
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: AppColors.grey100),
              ),
            )
          : Text(label),
    );
  }
}
