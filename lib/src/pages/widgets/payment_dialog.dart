import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel
      order; // para buscar informações de dentro do OrderModel, chamadmos o order que vem de dentro do OrderTile

  PaymentDialog({Key? key, required this.order}) : super(key: key);
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          alignment: Alignment.center,
          children: [

            Positioned(
              top:0,
              right: 0,

              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.close)),),

            //conteúdo da nova aba pix
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Titulo
                  Text(
                    'Pagamento com PIX',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  // QR conde
                  QrImage(
                    data: "51995189329",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),

                  // VEncimento
                  Text(
                    'Vencimento: ${utilServices.formatDateTime(order.overdueDateTime)}',
                    style: TextStyle(fontSize: 12),
                  ),

                  //Total
                  Text(
                    'Total ${utilServices.precoParaMoeda(order.total)}',
                    style:
                        const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),

                  //Botao copia e cola
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(width: 2, color: Colors.green),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        size: 15,
                      ),
                      label: const Text(
                        'Copiar código Pix',
                        style: TextStyle(fontSize: 13),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
