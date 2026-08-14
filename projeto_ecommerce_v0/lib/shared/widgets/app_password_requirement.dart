import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';

class AppPasswordRequirement extends StatelessWidget {
  const AppPasswordRequirement({
    super.key,
    required this.label,
    required this.isValid,
  });

  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: isValid ? Colors.green : Colors.black),
        Text(
          label,
          style: isValid
              ? AppTextStyle.passwordValidated
              : AppTextStyle.passwordNotValidated,
        ),
      ],
    );
  }
}
