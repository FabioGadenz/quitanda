import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  //valores serão passados no Order_tile
  final String
      status; //valor que será reecbido para verificar o status do pedido, vai ser passado pelo status do app_data
  final bool isOverdue; // para verificar se  a data do PIX esta vencido ou nao

  //vamos ter que passar  algum valor desse Mapa  para a String Status. será através do Get
  final Map<String, int> allStatus = <String, int>{
    'pendente': 0,
    'recusado': 1,
    'pago': 2,
    'preparando': 3,
    'em_rota': 4,
    'entregue': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({Key? key, required this.status, required this.isOverdue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDotpedido(isActive: true, titleStatus: 'Pedido confirmado'),
        _CustomDivider(),
        if (currentStatus == 1) ...[
          // se for  =1 cria uma nova lista (usando o ...) dentro da lista da COluna children com todos os outros status
          const _StatusDotpedido(
            isActive: true,
            titleStatus: 'Pix estornado',
            fundoDot: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDotpedido(
            isActive: true,
            titleStatus: 'Pagamento vencido',
            fundoDot: Colors.red,
          )
        ] else ...
          //Status do Dot do pedido
          [
           _StatusDotpedido(isActive: currentStatus >= 2, titleStatus: "Pagamento"),
          _CustomDivider(),
           _StatusDotpedido(isActive: currentStatus >= 3, titleStatus: "Preparando"),
          _CustomDivider(),
           _StatusDotpedido(isActive: currentStatus >=4, titleStatus: "Em Rota"),
          _CustomDivider(),
           _StatusDotpedido(isActive: currentStatus == 5, titleStatus: "Entregue"),
        ]
      ],
    );
  }
}

//widget para divider entre os status do pagamento
class _CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey,
    );
  }
}

// Classe Widget Texto do status do pagamento
class _StatusDotpedido extends StatelessWidget {
  final bool isActive;
  final String titleStatus;
  final Color? fundoDot;

  const _StatusDotpedido(
      {Key? key,
      required this.isActive,
      required this.titleStatus,
      this.fundoDot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //ponto de status
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomColors.customButtonGreen),
            color:
                isActive //se isActive for true, segue..  se tiver background foi nullo, ele segue para cor verde, senao branco
                    ? fundoDot ?? Colors.green
                    : Colors
                        .white, // se esta ativo, green, caso contrário white
          ),
          child: isActive
              ? Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : SizedBox.shrink(), //espaço em branco
        ),
        SizedBox(
          width: 5,
        ),
        //Status do ponto do status
        Expanded(
            child: Text(
          titleStatus,
          style: const TextStyle(fontSize: 12),
        ))
      ],
    );
  }
}
