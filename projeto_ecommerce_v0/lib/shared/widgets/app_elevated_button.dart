import 'package:flutter/material.dart';
import 'package:projeto_ecommerce_v0/shared/app_colors.dart';
import 'package:projeto_ecommerce_v0/shared/app_text_style.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.textButton,
    required this.darkBackground,
    required this.typeColorLetras,
  });

  final String textButton;
  final bool darkBackground;
  final bool typeColorLetras;
  //FALTA AJUSTAR O REDICIRECIONAMENTO DO MÉTODO PARA CADA TIPO DE BOTÃO
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},

      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(40),
        foregroundColor: (darkBackground ? AppColors.white : AppColors.black),
        backgroundColor: (typeColorLetras ? AppColors.black : AppColors.white),
        textStyle: AppTextStyle.buttonLabel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
        ),
      ),
      child: Text(textButton),
    );
  }
}
