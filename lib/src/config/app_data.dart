import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/models/user_model.dart';

//esse arquivo  funciona como MOK
//faz a instancia

//arquivo adicionando todos os dados necessarios
ItemModel banana = ItemModel(
  itemName: 'Banana',
  img: 'assets/fruits/banana.png',
  unit: 'Kg',
  price: 4.90,
  description:
      'Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha, Banana fresquinha,  ',
);
ItemModel kiwi = ItemModel(
  itemName: 'Kiwi',
  img: 'assets/fruits/kiwi.png',
  unit: 'Kg',
  price: 15.99,
  description: 'Kiwi importado',
);
ItemModel laranja = ItemModel(
  itemName: 'Laranja',
  img: 'assets/fruits/laranja.png',
  unit: 'Kg',
  price: 5.5,
  description: 'Laranja  docinha',
);
ItemModel maca = ItemModel(
  itemName: 'Maçã',
  img: 'assets/fruits/maca.png',
  unit: 'Kg',
  price: 8.50,
  description: 'A melhor maçã importada',
);
ItemModel mamao = ItemModel(
  itemName: 'Mamão',
  img: 'assets/fruits/mamao.png',
  unit: 'Un',
  price: 10,
  description: 'Mamão Doce',
);
ItemModel morango = ItemModel(
  itemName: 'Morango',
  img: 'assets/fruits/morango.png',
  unit: 'Kg',
  price: 20,
  description: 'Moranguinho  vermelhinho',
);

List<ItemModel> items = [
  banana,
  kiwi,
  laranja,
  maca,
  mamao,
  morango,
];
List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

//criando lista de item para o carrinho(cart_item_model)
List<CartItemModel> cartItems = [
  CartItemModel(item: maca, quantity: 1),
  CartItemModel(item: mamao, quantity: 5)
];

UserModel user = UserModel(
    name: 'name',
    email: 'fabio@gmail.com',
    celular: "51 999999999",
    cpf: "12312312310",
    senha: "11112222");

List<OrderModel> orders = [ //passando uma nova lista, dentro passando instancias de OrderModel
  //pedido1
  OrderModel(
      id: 'pedido 1 szdfgszgzsgf',
      createdDataTime: DateTime.parse('2023-04-03 10:30:00.000'),
      overdueDateTime: DateTime.parse('2023-04-03 11:30:00.000'),
      items: [
        CartItemModel(item: maca, quantity: 1),
        CartItemModel(item: morango, quantity: 3),],
      status: 'pendente',
      copyAndPaste: 'codepix',
      total: 0),
  //pedido2
  OrderModel(
      id: 'pedido 2 asdfasgfegsdfgzsgf',
      createdDataTime: DateTime.parse('2022-04-03 10:30:00.000'),
      overdueDateTime: DateTime.parse('2022-04-10 11:30:00.000'),
      items: [
        CartItemModel(item: maca, quantity: 2),
        CartItemModel(item: banana, quantity: 3),],
      status: 'entregue',
      copyAndPaste: 'codepix',
      total: 0),

];