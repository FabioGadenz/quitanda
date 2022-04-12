import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quitanda/src/config/app_data.dart'
    as app_data; // variavel app_data para chamar a outra tela
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/home/components/item_tile.dart';
import 'package:quitanda/src/services/utils_services.dart';

import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  // Lista de string informando as categorias da loja
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';


  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();//criando chave global para animação

  //criando uma nova função  chamada runADDTocardAnimation passando por paramentro um valor globalKey
  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage){ //função vai receber uma globalkey de uma imagem
    //ao receber, ele passa para Function acima por parametro o GlobalKey
    //para dar animação, isso precisa ser cololado nos Tiles por parametro que esta sendo mandado ali em baixo
    runAddToCardAnimation(gkImage);
  }

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App BAr
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GestureDetector( //para chamar o TOAST
           onTap: (){
             utilServices.showToast(message: "Mensagem do showToast", isError: true);

        },
          child: Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
            TextSpan(
                text: 'Quit',
                style: TextStyle(color: CustomColors.customPrimaryGreen)),
            TextSpan(
                text: 'anda',
                style: TextStyle(color: CustomColors.customContrastColor))
          ])),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  "1",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: AddToCartIcon(//Animação ao clicar no carrinho
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customPrimaryGreen,
                  ),
                ),
              ),
            ),
          )
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.easeIn,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
          this.runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            //Campo de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //centralizando o campo de pesquisa
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: ("Pesquise aqui..."),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 12),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                    size: 21,
                  ),
                  isDense: true,
                  //isso  faz diminuir um pouco  a altura do TextFormField
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),

                  // this.color = const Color(0xFF000000),
                  //     this.width = 1.0,
                  //     this.style = BorderStyle.solid,
                ),
              ),
            ),
            //Categorias
            Container(
              padding: EdgeInsets.only(left: 25),
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    // esse builder é o responsavel por disponibilizar os dados da lista para a tela
                    return CategoryTile(
                      pressionado: () {
                        setState(() {
                          selectedCategory = app_data.categories[index];
                        });
                      },
                      category: app_data.categories[index],
                      isSelected:
                          app_data.categories[index] == selectedCategory,
                    ); //jogga os dados da lista para a CATEGORY
                  }, //contexto nao será utilizado, usado o _
                  separatorBuilder: (_, i) {
                    return const SizedBox(
                        width: 10); //na horizontal com espaçamento de 10
                  }, //espaço entre os itens (precisa de contexto e index)
                  itemCount: app_data.categories.length),
            ), // aqui mostra o tamanho da lista

            //Grade de produtos
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: BouncingScrollPhysics(),
                //alterando a animação da grade
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio:
                      0.78, //alor do main axis, pra deixar o quadrado mais esticado na vertical
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: app_data.items[index],
                    cartAnimationMethod: itemSelectedCartAnimations,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
