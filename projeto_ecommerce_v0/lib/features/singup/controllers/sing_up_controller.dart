import 'package:flutter/material.dart';

class singUpController {
  String senha = '';
  String confirmarSenha = '';
  bool isActiveCheckbox = false;
  bool isActiveButton = false;
  bool isValidPassword = false;
  bool isLoading = false;

  final RegExp specialCaracterPassword = RegExp(
    r'^(?=.*[!@#$%^&*(),.?":{}|<>_\-+=]).*$',
  );

  final RegExp nameRegex = RegExp(r'^[A-Za-zÀ-ÿ\s]+$');
  final RegExp miniumCaracterMaisculo = RegExp(r'[A-Z]');
  final RegExp miniumCaracterMinusculo = RegExp(r'[a-z]');
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  bool isEmailValid() {
    return emailRegex.hasMatch(emailController.text.trim());
  }

  String? validateEmail(String? value) {
    if (emailRegex.hasMatch(emailController.text)) {
      //Sempre lembrar de colocar o .text pois faz parte do parâmetro  TextEditingController
      return null;
    }
    return 'E-mail inválido';
  }

  String? validateName(String? value) {
    if (nameRegex.hasMatch(nomeController.text)) {
      //Sempre lembrar de colocar o .text pois faz parte do parâmetro  TextEditingController
      return null;
    }
    return 'Nome inválido';
  }

  bool validacaoTamanhoSenha() {
    return senha.length >= 6;
  }

  bool validacaoCaracterEspecial() {
    return specialCaracterPassword.hasMatch(senha);
  }

  bool validacaoMinimoLetraMaiscula() {
    return miniumCaracterMaisculo.hasMatch(senha);
  }

  bool validacaoMinimoLetraMinusculo() {
    return miniumCaracterMinusculo.hasMatch(senha);
  }

  bool senhasConcidem() {
    return senha.isNotEmpty && senha == confirmarSenha;
  }

  void updateSenha(String value) {
    senha = value;
    changeActivateButton();
  }

  void updateConfirmarSenha(String value) {
    confirmarSenha = value;
    changeActivateButton();
  }

  void changeAtivateCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
    changeActivateButton();
  }

  void changeActivateButton() {
    isActiveButton =
        senhasConcidem() &&
        validacaoTamanhoSenha() &&
        validacaoCaracterEspecial() &&
        validacaoMinimoLetraMaiscula() &&
        validacaoMinimoLetraMinusculo() &&
        isActiveCheckbox;
  }

  List<Map<String, bool>> getPasswordRequirements() {
    return [
      {'Tamanho mínimo de 6 caracteres': validacaoTamanhoSenha()},
      {'Pelo menos um caractere especial': validacaoCaracterEspecial()},
      {'Pelo menos uma letra maiúscula': validacaoMinimoLetraMaiscula()},
      {'Pelo menos uma letra minúscula': validacaoMinimoLetraMinusculo()},
    ];
  }

  Future<void> singup() async {
    await Future.delayed(Duration(seconds: 2));
    print('Verifição dos dois segundos');
  }
}
