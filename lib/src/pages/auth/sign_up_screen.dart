import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/src/config/custom_colors.dart';

import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //informando o tamanho da tela para a variavel size. Essa variavel vai ser colcoda dentro da altura do ziedBOX

//Criando mascara para o campo CPF
    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
          filter: {'#' : RegExp(r'[0-9]')},
    );
    //criando mascara para campo celular
    final phoneFormatter = MaskTextInputFormatter(
      mask: '(##) # ####-####', filter: {'#': RegExp(r'[0-9]')},
      );




    return Scaffold(
      backgroundColor: CustomColors.customPrimaryGreen,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height, //pegando altura do size através do MediaQuery
          width: size.width,
          child: Stack(
            // Stack usado para fica sobreo fundo(primeiro/segundo plano)
            children: [
              //Botao para voltar
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
              ),

              Column(
                children: [
                  //Cadastro - Parte de cima
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: BoxDecoration(
                      color: CustomColors.customSecundaryWhite,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    //Formulario
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Email
                        CustomTextField(
                          icon: Icons.email,
                          label: 'Email',
                        ),
                        //senha
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Password',
                          isSecret: true,
                          isObscure: true,
                        ),
                        CustomTextField(
                          icon: Icons.person,
                          label: 'Nome',
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomTextField(
                          icon: Icons.web_sharp,
                          label: 'CPF',
                          inputFormatters: [cpfFormatter],
                        ),
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                onPressed: () {},
                                child: Text(
                                  'cadastrar usuários',
                                  style: TextStyle(fontSize: 18),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
