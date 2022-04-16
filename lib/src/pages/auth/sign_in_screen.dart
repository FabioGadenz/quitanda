import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/base/base_screen.dart';

import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final size = MediaQuery.of(context)
        .size; //informando o tamanho da tela para a variavel size. Essa variavel vai ser colcoda dentro da altura do ziedBOX

    return Scaffold(
      backgroundColor: CustomColors.customPrimaryGreen,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height, //pegando altura do size através do MediaQuery
          width: size.width,
          child: Column(
            children: [
              //parte de cima
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    //nome do App
                    child: Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                              text: 'Quit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'anda',
                              style: TextStyle(
                                  color: CustomColors.customContrastColor)),
                        ],
                      ),
                    ),
                  ),
                  //Categorias
                  Container(
                    height: 30,
                    child: SizedBox(
                      //width: 250.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('verduras'),
                            FadeAnimatedText('Grãos'),
                            FadeAnimatedText('Temperos'),
                            FadeAnimatedText('Cereais'),
                          ],
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),

                  //Imagem do logotipo
                  Container(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        'https://img.elo7.com.br/product/zoom/1B42523/painel-quitanda-g-frete-gratis-decoracao-infantil.jpg',
                      ),
                    ),
                  ),
                ],
              )),

              //Container de baixo, nao foi usado o Expanded, para usar o que for precido de espaço
              //parte de baixo = Container Formulário
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: BoxDecoration(
                    color: CustomColors.customSecundaryWhite,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Email
                    CustomTextField(
                      icon: Icons.email,
                      label: 'Email',
                      controller: emailController,
                    ),
                    //senha
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Password',
                      isSecret: true,
                      isObscure: true,
                      controller: passwordController,
                    ),
                    //Botao de entrar
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            print(emailController.text);
                            print(passwordController.text);
                            Navigator.of(context).pushReplacement(
                                //pushREPLACEMENT  ele substitui a tela anterior após se logar
                                MaterialPageRoute(builder: (r) {
                              return BaseScreen();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    //Esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueci a senha!',
                            style: TextStyle(color: Colors.black26),
                          )),
                    ),
                    //Linha divisória
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: const [
                          Expanded(
                              child: Divider(
                            color: Colors.black26,
                            thickness: 1,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("Ou"),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.black26,
                            thickness: 1,
                          )),
                        ],
                      ),
                    ),
                    //Botao criar conta
                    SizedBox(
                      height: 40,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              side: BorderSide(width: 2, color: Colors.green)),
                          onPressed: () {
                            Get.toNamed('/SignUp');
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (rota) {
                            //   return SignUpScreen();
                            // }));
                          },
                          child: const Text(
                            "Criar conta",
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
