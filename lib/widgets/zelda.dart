import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gato/config/confi.dart';

class Celda extends StatelessWidget {
  final estados inicial;
  final double cubo;
  final Function() press;
  const Celda({required this.inicial,required this.cubo,required this.press,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cubo, width: cubo,
      child: CupertinoButton(
          onPressed: press,
          child: mostrar(),//metodo para evaluar el estado de la celda y mostrar algo

      ),
    );
  }


    Widget mostrar() {
    if(inicial==estados.vacio){
      return SizedBox(height: cubo,width: cubo,);
    }
    if(inicial==estados.circulo){
      return Image.asset("imagenes/o.png");
    }else{
     return Image.asset("imagenes/x.png");
    }
  }
}

