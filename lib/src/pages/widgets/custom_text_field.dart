import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  //passando informações atravé de construtores. Para isso constroi-se variaveis para poder passar por parametro
  final IconData icon;
  final String label;
  final bool isSecret;
  bool isObscure;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValueTextForm; //Caso nao for passado o sinal de "?" indica que é null
  final bool readOnlyTxtForm;

  CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.isObscure = false,
    this.inputFormatters,
    this.initialValueTextForm,
    this.readOnlyTxtForm = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: widget.readOnlyTxtForm,

        initialValue: widget.initialValueTextForm,//isso vai indicar o que sera mostrado inicialmente no TextFormField
        inputFormatters: widget.inputFormatters,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
//se isisSecret for = true, coloca o Icon, caso contrario null
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        // faz a inversao do valor ao clicar no botao pra ver ou esconder a senha
                        widget.isObscure = !widget.isObscure;
                      });
                    },
                //se obscure for true, mostra icon de olho, caso contrario  icon(esconde olho)
                    icon: widget.isObscure
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off))
                : null,
            labelText: widget.label,
            isDense: true,
            // para diminuir um pouco os espaços entre bordas e texto
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
