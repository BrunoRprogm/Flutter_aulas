import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

//class _LoginPageState extends State<LoginPage>

class _SignupPageState extends State<SignupPage> {
  bool isActiveCheckbox = false;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveButton = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton =
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty &&
        isActiveCheckbox;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 24,
            children: [
              Column(
                spacing: 2,
                children: [
                  Text('Criar uma conta', style: AppTextStyle.title),
                  Text(
                    'Insira seus dados para iniciar as compras',
                    style: AppTextStyle.subtitle,
                  ),
                ],
              ),
              AppTextField(
                hintText: 'email@dominio.com',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'nome',
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'senha',
                onChanged: (value) {
                  setState(() {
                    senha = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'confirmar senha',
                onChanged: (value) {
                  setState(() {
                    confirmarSenha = value;
                  });
                },
              ),
              Spacer(),

              GestureDetector(
                onTap: () => print(
                  'Abrindo link para Termos de Serviço e Política de Privacidade',
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: isActiveCheckbox,
                      onChanged: (value) => {
                        setState(() {
                          isActiveCheckbox = value!;
                        }),
                      },
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Ao clicar em continuar, você concorda \ncom os nossos ',
                            style: AppTextStyle.textSpan,
                          ),
                          TextSpan(
                            text: 'Termos de Serviço ',
                            style: AppTextStyle.highlightedTextSpan,
                          ),
                          TextSpan(
                            text: 'e com a ',
                            style: AppTextStyle.textSpan,
                          ),
                          TextSpan(
                            text: '\nPolítica de Privacidade ',
                            style: AppTextStyle.highlightedTextSpan,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppElevatedButton(
                onPressed: isActiveButton ? () {} : null,
                buttonText: 'Continuar',
                type: ButtonType.filled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
