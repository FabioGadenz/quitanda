import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/widgets/custom_text_field.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do usuário'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
      ),
      //criando formulario através de listview
      body: ListView(
        physics: const BouncingScrollPhysics(), //animação ao puxar a lista
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //Email
          CustomTextField(
            readOnlyTxtForm: true,
            initialValueTextForm: appData.user.email,
            icon: Icons.email,
            label: 'Email',
            controller: emailController,
          ),
          //Nome
          CustomTextField(
            readOnlyTxtForm: true,
            initialValueTextForm: appData.user.name,
            icon: Icons.person,
            label: 'Nome',
            controller: nameController,
          ),
          //Celular
          CustomTextField(
            readOnlyTxtForm: true,
            initialValueTextForm: appData.user.celular,
            icon: Icons.phone,
            label: 'Celular',
            controller: phoneController,
          ),
          //CPF
          CustomTextField(
            readOnlyTxtForm: true,
            initialValueTextForm: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            isObscure: true,
            controller: cpfController,
          ),
          //Botao atualziar senha

          SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  updatePassword();
                },
                child: Text("Atualizar senha")),
          )
        ],
      ),
    );
  }

  //criando função para aprensetar o Dialog para atualziar senha

  Future<bool?> updatePassword() {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return showDialog(
        context: context,
        builder: (c) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    //esse dialog tem que usar o minimo de espaço possível
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        //Titulo
                        child: Text(
                          "Atualização de senha",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      //Campo senha atual
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha atual',
                        isObscure: true,
                        isSecret: true,
                        controller: currentPasswordController,
                      ),
                      //Campo nova senha
                      CustomTextField(
                        icon: Icons.lock_open_outlined,
                        label: 'Nova Senha',
                        isSecret: true,
                        isObscure: true,
                        controller: newPasswordController,
                      ),
                      //Campo confirmar nova senha
                      CustomTextField(
                        icon: Icons.lock_open_outlined,
                        label: 'Confirmar nova senha',
                        isSecret: true,
                        isObscure: true,
                        controller: confirmPasswordController,
                      ),
                      //Botao para confirmar
                      SizedBox(
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {},
                              child: Text("Atualizar")))
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                    ))
              ],
            ),
          );
        });
  }
}
