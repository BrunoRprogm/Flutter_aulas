import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _senhaRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid => _senhaRegex.hasMatch(senhaController.text.trim());
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool isActiveCheckbox = false;
  bool isLoading = false;

  Future<void> handleLogin() async {
    if (key.currentState!.validate()) {
      //Pedir explicação sobre o currentState!.validate
      isLoading = true;
      notifyListeners();

      await login();
      print('Executei o login do controller');

      isLoading = false;
      notifyListeners();
    }
  }

  void changeAtivateCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
    notifyListeners();
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
