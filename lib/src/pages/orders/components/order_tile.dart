

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda/src/pages/widgets/payment_dialog.dart';
import 'package:quitanda/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({Key? key, required this.order}) : super(key: key);

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        //isso faz sumir uma barrinha que aparecia ao esticar o card para baixo
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pendente',
          // o se order.status for pendente, ele vai iniciar com a janelinha aberta
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilServices.formatDateTime(order.createdDataTime),
                style: TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          //
          children: [
            IntrinsicHeight(
              // para informar que a altura da row é intrinsico, vai esticar até onde precisa, o verticalDivider  vai precisar disso
              child: Row(
                children: [
                  //Lista de produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((e) {
                          return _OrderItemWidget(
                            utilServices: utilServices,
                            e: e,
                          ); //_OrderItemWidget foi refatorado, e esta criado logo ali em baixo
                        }).toList(),
                      ),
                    ),
                  ),
                  //Risco vertical fazendo divisão
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    width: 8,
                  ),
                  //Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      //passando o order.status para o status  que fica dentro do OrderStatus Widget
                      isOverdue: order.overdueDateTime.isBefore(DateTime
                          .now()), //pegando a data do APPData e comparando com data atual, se é true ou false
                    ),
                  ),
                ],
              ),
            ),

            //Total geral do pedido
            Text.rich(TextSpan(style: TextStyle(fontSize: 20), children: [
              const TextSpan(
                text: 'Total ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: utilServices.precoParaMoeda(order.total),
              ),
            ])),

            //Botão de pagamento PIX
            Visibility(
              visible: order.status == 'pendente',
              //se  estiver pendente de pagamento o botao vai ficar visivel
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  showDialog(context: context, builder: (_){//_nao usa _//
                    return PaymentDialog(order: order,); //repassando dados do OrderModel através do order
                  });
                },
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 18,
                ),
                label: Text('VEr QR Code PIX'),
              ),
              //replacement: (outro widget) caso queiramos mostar outro widget
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget(
      {Key? key, required this.utilServices, required this.e})
      : super(key: key);

  final UtilServices utilServices;
  final CartItemModel e;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${e.quantity} ${e.item.unit} ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(e.item.itemName)),
          Text(
            utilServices.precoParaMoeda(e.totalPrice()),
          )
        ],
      ),
    );
  }
}
