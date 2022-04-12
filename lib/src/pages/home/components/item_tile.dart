import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/item_model.dart';
import '../../product/product_screen.dart';
import 'package:quitanda/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({Key? key, required this.item, required this.cartAnimationMethod}) : super(key: key);

  final ItemModel item;
  final  void Function(GlobalKey) cartAnimationMethod;
  final GlobalKey imageGk =  GlobalKey();

  UtilServices utilServices =
      UtilServices(); //Estanciando um novo objeto do UtilServices com nome de utilservices E recebe um novo UtilServices()

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteúdo da tela compras HOME
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ProductScreen(
                  item:
                      item); // especificando um item, e falamos que é o item mesmo que queremos(item do ItemModel)
            }));
          },
          child: Card(
            elevation: 5, //tamanho da sombra
            shadowColor: Colors.grey.shade300, //cor da sombra
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //enviando texto para esquerda

                children: [
                  //Imagem
                  Expanded(
                    //widget HERO serve para criar animação da Imagem, na tag precisa ser o nomeunico da imagem
                      child: Hero(tag: item.img, child: Image.asset(item.img, key: imageGk, ),),),

                  //Nome
                  Text(
                    item.itemName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  // Preço/Unidade
                  Row(
                    children: [
                      Text(
                        utilServices.precoParaMoeda(item.price),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customPrimaryGreen),
                      ),
                      Text(
                        '/ ${item.unit}', // para imprimir o kg/ e  o Unit
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        //ICONE  add  carrinho de compras
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                cartAnimationMethod(imageGk);//animção da imagem ao add no carrinho
              },
              child: Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                    color: CustomColors.customPrimaryGreen,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
