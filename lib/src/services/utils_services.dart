
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilServices{
  //R$ Valor - convertendo o preco para uma moeda. Retonna valor como string
  //precoParaMoeda recebe preco


  String precoParaMoeda(double preco){
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(preco);

  }

  //PADRAO DE DATA  e HORA BR

  String formatDateTime(DateTime dateTime){
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

//criando metodo TOAST
void showToast({required String message, bool isError =  false}){

  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}



}