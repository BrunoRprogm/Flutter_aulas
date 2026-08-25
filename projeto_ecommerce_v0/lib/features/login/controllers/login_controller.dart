import 'package:flutter/material.dart';

class User {
  final String email;
  final String nome;

  User({required this.email, required this.nome});
}

class LoginController extends ChangeNotifier {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _senhaRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaValid => _senhaRegex.hasMatch(senhaController.text.trim());

  User? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> key =
      GlobalKey<
        FormState
      >(); // Utilizada para validar nosso formulário por dentro do controller

  bool isActiveCheckbox = false;
  bool isLoading = false;

  Future<void> handleLogin() async {
    // Lógica de validaão mais o loading do botão entrar etc.

    if (key.currentState!.validate()) {
      //Pedir explicação sobre o currentState!.validate
      isLoading = true;
      notifyListeners(); //notifyListeners notifica nossa aplicação que algo foi alterado na tela e precisa rebuildar.

      await login();
      print('Executei o login do controller');
      isLoading = false;
      notifyListeners();
      emailController.clear();
      senhaController.clear();
      return;
    }
    throw ErrorDescription('validação incorreta!');
  }

  void changeAtivateCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
    notifyListeners();
  }

  Future<void> login() async {
    //simula o delay de uma chamada dA API
    await Future.delayed(Duration(seconds: 2));
    user = User(email: emailController.text, nome: "bruno");
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
