import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/pages/signup_page.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea desconta espaços do dispositivo (ex.: barra superior)
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text('+DevsEcomm', style: AppTextStyle.title),
              Spacer(flex: 2),
              AppTextField(hintText: 'email@dominio.com'),
              AppTextField(hintText: '**********'),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () => {},
                    child: Text('Esqueci minha senha'),
                  ),
                ],
              ),
              AppElevatedButton(
                type: ButtonType.filled,
                onPressed: () {},
                buttonText: 'Entrar',
              ),
              AppElevatedButton(
                type: ButtonType.outlined,
                onPressed: () {
                  //navegação para a página de cadastro
                  Navigator.pushNamed(context, SignupPage.route);
                },
                buttonText: 'Cadastrar-se',
              ),
              Spacer(flex: 2),
              GestureDetector(
                onTap: () => {print('Cliquei na linha')},
                // RichText: Aninhar textos e e modificar seu style
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Termos de Serviço',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' e ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Política de Privacidade',
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
    );
  }
}
