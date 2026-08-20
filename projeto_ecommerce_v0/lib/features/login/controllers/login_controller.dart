import 'package:flutter/material.dart';

class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _senhaRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid => _senhaRegex.hasMatch(senhaController.text.trim());
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool isActiveCheckbox = false;
  bool isLoading = false;

  void changeAtivateCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
  }

  Future<void> login() async {
    //simula o delay de uma chamada dA API
    await Future.delayed(Duration(seconds: 2));
    print("agora executou os dois segundos depois");
  }

  //Criado uma função chamada por validate que fara a verificação do campo e-mail.
  String? validateEmail(String? value) {
    if (_emailRegex.hasMatch(emailController.text)) {
      //Sempre lembrar de colocar o .text pois faz parte do parâmetro  TextEditingController
      return null;
    }
    return 'E-mail inválido';
  }

  String? validatePassword(String? value) {
    print(_senhaRegex.hasMatch(senhaController.text));
    if (_senhaRegex.hasMatch(senhaController.text)) {
      return null;
    }
    return 'Senha inválida';
  }
}
