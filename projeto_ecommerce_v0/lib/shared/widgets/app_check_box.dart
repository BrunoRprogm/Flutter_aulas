import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    this.onChanged,
    this.hasError = false,
  });

  final bool value;
  final Function(bool?)? onChanged;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      side: hasError ? BorderSide(color: Colors.red, width: 2) : null,
    );
  }
}
