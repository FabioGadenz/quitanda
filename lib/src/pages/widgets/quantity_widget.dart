import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {

  final int value;
  final String suffixItem;
  //recebe por Função (lá do product screen) que recebe quantity do tipo int e o nome é result.
  final Function(int quantity) result;
  final bool  isRemovable;

  const QuantityWidget(
      {Key? key,
  required this.value,
  required this.suffixItem,
  required this.result,
        this.isRemovable = false,
      }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      // height: 20,
      // width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,//isso não deixa crescer demais distorcendo
        children: [

          _QuantityButton(
            color: !isRemovable || value >1 ? Colors.grey : Colors.red, //se isRemovable for false ou valor maior que 1, usa cor cinza, caso contrario cor vermelho
            icon: !isRemovable || value >1 ? Icons.remove  : Icons.delete_forever, //se  for removable for false(!) ou(||) valor for maior que um,  vamos apresentar  icon.remove (para diminuir) : caso contrário vamos apresentar o delete
            onPressed: () {
              if(value == 1 && !isRemovable) return; //se for removeble for false E  value= 1, retorna nada, caso contrario segue
              int resultCount = value -1;
              result(resultCount);
            },
          ),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '$value $suffixItem',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),),
          _QuantityButton(
            color: CustomColors.customPrimaryGreen,
            icon: Icons.add,
            onPressed: () {
              int resultCount = value +1;
              result(resultCount);

            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color; //passando por parametros
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.color, //passando por parametros
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        //  quase igual o Gesturedetector, Porem precisa estar dntro de um Material e ser chamado o INK tbm
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,

        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
