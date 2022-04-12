import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/pages/widgets/quantity_widget.dart';
import 'package:quitanda/src/services/utils_services.dart';


//==============================
// Criando tile do carrinho (lista) com os itens
//================================

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        //Imagem
        leading: Image.asset(widget.cartItem.item.img, height: 60, width: 60,),
        //Titulo
        title: Text(widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),),
        //Total
        subtitle: Text(
          utilServices.precoParaMoeda(widget.cartItem.totalPrice()),
          style: TextStyle(color: CustomColors.customButtonGreen,
              fontWeight: FontWeight.bold),),

        //Quantidade
        trailing: QuantityWidget(suffixItem: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (quantity == 0){
              //remover item do carrinho. informando que sera removido la no cartTab
              widget.remove(widget.cartItem);

              }
            });
          }, //result é a função que receberá a quantity
          isRemovable: true,
        ),


      ),
    );
  }
}
