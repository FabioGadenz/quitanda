import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/cart/cart_tab.dart';
import 'package:quitanda/src/pages/home/home_tab.dart';
import 'package:quitanda/src/pages/orders/orders_tab.dart';
import 'package:quitanda/src/pages/profile/profile_tab.dart';


class BaseScreen extends StatefulWidget {

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int bottomindex =0; //esse index vai ser para setar qual botao estar selecionado no BottomNavigation
  final pageCtrl = PageController();// variavel recebe o Pagecontroller, onde vai receber o mesmo index do botao la em baixo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),//nao deixa fazer scrol na horizontal deslizando as telas
        controller: pageCtrl,
        children: [
          //Tela Home
          HomeTab(),
          //Carrinho
          CartTab(),
          //Pedidos
          OrdersTab(),
          //Perfil
          ProfileTab(),
        ],
      ),
      //Botões da barra
      bottomNavigationBar: BottomNavigationBar(
        // selecionando o index da seleção dos botões
        currentIndex: bottomindex,
        onTap: (index){
          setState(() {
            bottomindex = index;

            //sem animação
            //pageCtrl.jumpToPage(index);//selecionando o mesmo index do botao para a pagina
            //com animação
            pageCtrl.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          });

        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customPrimaryGreen,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black26,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home',),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Carrinho'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
