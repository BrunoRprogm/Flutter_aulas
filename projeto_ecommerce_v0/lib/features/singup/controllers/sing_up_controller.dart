import 'package:flutter/material.dart';

class singUpController {
  String confirmarSenha = '';
  bool isActiveCheckbox = false;
  bool isActiveButton = false;
  bool isValidPassword = false;
  bool isLoading = false;
  bool hasErrorCheckbox = false;

  final RegExp specialCaracterPassword = RegExp(
    r'^(?=.*[!@#$%^&*(),.?":{}|<>_\-+=]).*$',
  );

  final RegExp nameRegex = RegExp(r'^[A-Za-zÀ-ÿ\s]+$');
  final RegExp miniumCaracterMaisculo = RegExp(r'[A-Z]');
  final RegExp miniumCaracterMinusculo = RegExp(r'[a-z]');
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

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

  String? validateSenha(String? value) {
    if (!validacaoCaracterEspecial()) {
      return 'caracter especial não atendido.';
    }

    if (!validacaoTamanhoSenha()) {
      return 'tamanho de senha não atendido';
    }

    if (!validacaoMinimoLetraMinusculo()) {
      return 'No mínimo 1 letras mínuscula deve estar inserida';
    }

    if (!validacaoMinimoLetraMaiscula()) {
      return 'No mínimo 1 letras maíscula deve estar inserida';
    }

    if (!senhasConcidem()) {
      return 'Senhas não coincidem';
    }
  }

  bool validacaoTamanhoSenha() {
    return senhaController.text.length >= 6;
  }

  bool validacaoCaracterEspecial() {
    return specialCaracterPassword.hasMatch(senhaController.text);
  }

  bool validacaoMinimoLetraMaiscula() {
    return miniumCaracterMaisculo.hasMatch(senhaController.text);
  }

  bool validacaoMinimoLetraMinusculo() {
    return miniumCaracterMinusculo.hasMatch(senhaController.text);
  }

  bool senhasConcidem() {
    return senhaController.text.isNotEmpty &&
        senhaController.text == confirmarSenha;
  }

  void updateSenha(String value) {
    senhaController.text = value;
    changeActivateButton();
  }

  void updateConfirmarSenha(String value) {
    confirmarSenha = value;
    changeActivateButton();
  }

  void changeAtivateCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
    hasErrorCheckbox = false;
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

  Future<void> singup() async {
    await Future.delayed(Duration(seconds: 2));
    print('Verifição dos dois segundos');
  }
}
