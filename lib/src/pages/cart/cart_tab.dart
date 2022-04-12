import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/components/cart_tile.dart';
import 'package:quitanda/src/pages/widgets/payment_dialog.dart';
import 'package:quitanda/src/services/utils_services.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;

//=================================================
//TELA DO CARRINHO
//=================================================
class CartTab extends StatefulWidget {
  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilServices utilServices = UtilServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
      utilServices.showToast(message: "Item ${cartItem.item.itemName} removido");
    });
  }

//Criando Método para apresentar o total to carrinho
  double cartTotalPrice() {
    double total = 0;

    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (_, i) {
                return CartTile(
                  cartItem: appData.cartItems[i],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),
          //Total e botão de concluir pedido
          Container(
            padding: EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white12, blurRadius: 3, spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Valor total',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  utilServices.precoParaMoeda(cartTotalPrice()),
                  style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.customPrimaryGreen,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: CustomColors.customButtonGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),

                    //Botao concluir pedido
                    onPressed: () async {
                      //criando função
                      bool? result = await showOrderConfirmation(); //bool?  resulta, pq ele esta esperando um resultado false/ou true
                      if (result ?? false)//se result verdadeiro, ele segue, ?? se for nulo ele será inidicado como falso
                        {

                        showDialog(context: context, builder: (_){//_nao usa _//
                          return PaymentDialog(order: appData.orders.first,//repassando dados do OrderModel através do order
                          );
                        },
                        );

                        } else {utilServices.showToast(message: 'Pedido nao finalizado', isError: true);}
                    },
                    child: const Text(
                      'Concluir Pedido',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('COnfirmação'),
            content: Text("Deseja realmente concluir o pedido?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); //false pq a função está esperando um bool
                },
                child: Text('Não'),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Sim'))
            ],
          );
        });
  }
}
