import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:quitanda/src/pages/orders/components/order_tile.dart';


//Tela de Pedidos

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
        ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),//efeitos
          itemBuilder: (_,index){
            return OrderTile(order: appData.orders[index],);
          },
          separatorBuilder: (_,index){
            return const SizedBox(height: 10,);
          },
          itemCount: appData.orders.length),
    );
  }
}
