import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/features/recover/pages/recover_page.dart';
import 'package:more_devs_do_zero/features/singup/pages/signup_page.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safearea desconta espaços do disposito ex: barra superior
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<LoginController>(
            builder: (context, controller, child) {
              return Form(
                key: controller.key, //Pedir explicação sobre como isso funciona
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

                        Center(
                          child: Text('+DevsEcomm', style: AppTextStyle.title),
                        ),
                        Spacer(flex: 2),
                        AppTextField(
                          controller: controller.emailController,
                          validator: (value) {
                            //inserido validateEmail
                            return controller.validateEmail(
                              value,
                            ); //puxando o método pelo controller
                          },
                          hintText: 'email@dominio.com',
                        ),
                        SizedBox(height: 16),
                        AppTextField(
                          controller: controller.senhaController,
                          //   errorText: controller.senhaError,
                          validator: (value) {
                            return controller.validatePassword(value);
                          },
                          hintText: '****************',
                          obscureText: true,
                        ),
                        Row(
                          children: [
                            AppCheckBox(
                              value: controller.isActiveCheckbox,
                              onChanged: (value) {
                                controller.changeAtivateCheckBox();
                              },
                            ),
                            Text('Lembrar de mm', style: AppTextStyle.textSpan),
                          ],
                        ),
                        Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: TextButton(
                            onPressed: () => {
                              //Basicamente estou dizendo que quando meu usuário clickar em esqueci minha senha ele será direcionado a outra tela
                              Navigator.pushNamed(context, RecoverPage.route),
                            },
                            child: Text(
                              'Esqueci minha senha',
                              style: AppTextStyle.buttonLabel.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        AppElevatedButton(
                          label: 'Entrar', //
                          isLoading: controller.isLoading,
                          onPressed: controller.handleLogin,
                          type: ButtonType.filled,
                        ),
                        SizedBox(height: 12),
                        AppElevatedButton(
                          label: 'Cadastrar',
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
              );
            },
          ),
        ),
      ),
    );
  }
}
