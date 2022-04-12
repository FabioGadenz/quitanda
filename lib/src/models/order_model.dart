import 'package:quitanda/src/models/cart_item_model.dart';

//CRIANDO CLASSE PARA ESTRUTURAR PARA OS PEDIDOS



class OrderModel{
  String id;
  DateTime createdDataTime;
  DateTime overdueDateTime;//data vencimento do PIX
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total; //total do pedido em relação a todos os produtos

  OrderModel({
    required this.id,
    required this.createdDataTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,


});
}