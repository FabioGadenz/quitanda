import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/pages/widgets/quantity_widget.dart';
import 'package:quitanda/src/services/utils_services.dart';

class ProductScreen extends StatefulWidget {
  //recebendo por parametro o item clicado, para mostrar a IMG e descrição do item que clicamos
  ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  UtilServices utilServices = UtilServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Stack para sobrepor o botao de voltar por cima
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
                child: IconButton(
              onPressed: () => Navigator.of(context).pop(), //.pop para fechar a tela

              icon: Icon(Icons.arrow_back_ios),
            )),
          ),

          //TOODo conteudo da pagina
          Column(
            children: [
              Expanded(
                child: Hero(tag: widget.item.img,//Hero widget para animação na Imagem
                child: Image.asset(widget.item.img)),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32),
                  //color: CustomColors.customSecundaryWhite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                      color: CustomColors.customSecundaryWhite,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, offset: Offset(0, 2))
                      ]), //sombra

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Nome
                          Text(
                            widget.item.itemName,
                            maxLines: 2,
                            //serve para informar que o campo do nome seja somente 2 linhas
                            overflow: TextOverflow.ellipsis,
                            // para se caso for maior que 2 linhas ele coloca os ...
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          //Quantidade
                          QuantityWidget(
                            suffixItem: widget.item.unit, // passando por parametro  o item.unit para o suffixItem que esta dentro de QuantityWidget
                            value: cartItemQuantity,
                            result: (int quantity){// o resultado da operação usando oresult la no quantityWidget, é passado para o quantity aqui
                              setState(() {
                                cartItemQuantity = quantity;
                              });

                            },),
                        ],
                      ),
                      //Preço
                      Text(
                        utilServices.precoParaMoeda(widget.item.price),
                        style: TextStyle(
                            fontSize: 23,
                            color: CustomColors.customPrimaryGreen,
                            fontWeight: FontWeight.bold),
                      ),

                      //Descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: TextStyle(
                                  height: 1.5), //espaçamento entre as linhas
                            ),
                          ),
                        ),
                      ),

                      //Botão
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          label: Text(
                            'Add ao carrinho',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          icon: Icon(Icons.add_shopping_cart_outlined),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
