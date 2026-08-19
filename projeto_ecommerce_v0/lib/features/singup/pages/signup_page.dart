import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/features/singup/controllers/sing_up_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_password_requirement.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}
//class _LoginPageState extends State<LoginPage>

class _SignupPageState extends State<SignupPage> {
  singUpController singupcontroller = singUpController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> singup() async {
    setState(() {
      singupcontroller.isLoading = true;
    });

    await singupcontroller.singup();

    print('Executou os dois segundos');

    setState(() {
      singupcontroller.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    singupcontroller.email = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'nome',
                onChanged: (value) {
                  setState(() {
                    singupcontroller.nome = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'senha',
                onChanged: (value) {
                  setState(() {
                    singupcontroller.senha = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'confirmar senha',
                onChanged: (value) {
                  setState(() {
                    singupcontroller.confirmarSenha = value;
                  });
                },
              ),

              AppPasswordRequirement(
                label: 'Mínimo de 6 caracteres',
                isValid: singupcontroller.validacaoTamanhoSenha(),
              ),
              AppPasswordRequirement(
                label: 'No mínimo um caracteres especial',
                isValid: singupcontroller.validacaoCaracterEspecial(),
              ),
              AppPasswordRequirement(
                label: 'No mínimo uma letra maiuscula',
                isValid: singupcontroller.validacaoMinimoLetraMaiscula(),
              ),
              AppPasswordRequirement(
                label: 'No mínimo uma letra minusculas',
                isValid: singupcontroller.validacaoMinimoLetraMinusculo(),
              ),
              AppPasswordRequirement(
                label: 'As senhas concidem',
                isValid: singupcontroller.senhasConcidem(),
              ),

              GestureDetector(
                onTap: () => print(
                  'Abrindo link para Termos de Serviço e Política de Privacidade',
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: singupcontroller.isActiveCheckbox,
                      onChanged: (value) {
                        setState(() {
                          singupcontroller.changeAtivateCheckBox();
                        });
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
                label: 'Continuar',
                isLoading: singupcontroller.isLoading,
                onPressed: singupcontroller.isActiveButton
                    ? () => singup()
                    : null,
                type: ButtonType.filled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
