import 'package:flutter/material.dart';
import 'package:projeto_ecommerce_v0/shared/app_text_style.dart';
import 'package:projeto_ecommerce_v0/shared/widgets/app_elevated_button.dart';
import 'package:projeto_ecommerce_v0/shared/widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeAre desconto os compoonentes nativos do celular, tipo bateria hora
      //e sinal do wifi, ex: evita que o devsecomm fique do lado do hórario do celuar.
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text('+DevsEcomm', style: AppTextStyle.tittle),
              Spacer(flex: 2),
              AppTextField(hintText: 'email@dominio.com'),
              AppTextField(hintText: '***************'),
              TextButton(
                onPressed: () => {},
                child: Text('Esqueci minha senha'),
              ),
              AppElevatedButton(
                typeColorLetras: true,
                darkBackground: true,
                textButton: 'Entrar',
              ),
              ElevatedButton(onPressed: () {}, child: Text('Cadastrar-se')),
              Spacer(flex: 2),

              //Adiciona interação em qualquer objeto
              GestureDetector(
                onTap: () {
                  print('Cliquei na linha1');
                },
                //RichText, serve para escrevermos uma porrada de texto,
                //permitindo que voce possa personalizar caa um da sua maneira.
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Termos de Serviço',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' e',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: ' Políticas de Privacidade',
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
