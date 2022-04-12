import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.pressionado,
  }) : super(key: key);

  String category;
  bool isSelected;
  final VoidCallback pressionado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressionado,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          //espaçamento lateral entre os botoes

          decoration: BoxDecoration(
              color: isSelected ? CustomColors.customPrimaryGreen : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            category,
            style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : CustomColors
                        .customContrastColor, //se ISSelected branco SE Nâo,  cor vermelha
                fontWeight: FontWeight.bold,
            fontSize: isSelected ? 16 : 14),//se selecionado fonte 16, caso contrario 14

          ),
        ),
      ),
    );
  }
}
