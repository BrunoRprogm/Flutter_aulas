import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';

class TittleRowProduct extends StatelessWidget {
  final String nameTittle;

  const TittleRowProduct({super.key, required this.nameTittle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsetsGeometry.only(left: 14)),
        Text(nameTittle, style: AppTextStyle.titleProduct),
        Icon(Icons.chevron_right_rounded),
      ],
    );
  }
}
