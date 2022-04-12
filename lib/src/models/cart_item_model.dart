import 'package:quitanda/src/models/item_model.dart';


//criando nova classe para o CARRINHO
class CartItemModel {

  ItemModel item;
  int quantity;

  //CRIANDO CONSTRUTOR

  CartItemModel({required this.item,
    required this.quantity,});

  // AERO FUNCTION
  // double totalPrice()=>item.price * quantity;
  double totalPrice(){
    return item.price * quantity;}
  

}
