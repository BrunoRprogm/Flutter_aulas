import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/features/singup/controllers/pages/signup_page.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  initState() {
    super.initState();
  }

  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safearea desconta espaços do disposito ex: barra superior
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),

                  Image.asset('assets/images/locker.png', height: 120),

                  Center(child: Text('+DevsEcomm', style: AppTextStyle.title)),
                  Spacer(flex: 2),
                  AppTextField(
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        loginController.setEmail(value);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    hintText: '****************',
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        loginController.setSenha(value);
                      });
                    },
                  ),
                  Row(
                    children: [
                      AppCheckBox(
                        value: loginController.isActiveCheckbox,
                        onChanged: (value) {
                          setState(() {
                            loginController.changeAtivateCheckBox();
                          });
                        },
                      ),
                      Text('Lembrar de mm', style: AppTextStyle.textSpan),
                    ],
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        'Esqueci minha senha',
                        style: AppTextStyle.buttonLabel.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  AppElevatedButton(
                    buttonText: 'Entrar',
                    onPressed: loginController.isActiveButton
                        ? () => print('cliquei em entrar')
                        : null,
                    type: ButtonType.filled,
                  ),
                  SizedBox(height: 12),
                  AppElevatedButton(
                    buttonText: 'Cadastrar',
                    onPressed: () => {
                      Navigator.pushNamed(context, SignupPage.route),
                    },
                    type: ButtonType.outlined,
                  ),
                  Spacer(flex: 2),
                  //GestureDetector adiciona métodos de interação com usuario ex: onTap
                  GestureDetector(
                    onTap: () {
                      print('CLIQUEI NA LINHA');
                    },
                    //RichText - Aninhar textos e modificar seu alinhamento
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Termos de Serviço ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'e ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: 'Politicas de Privacidade',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
