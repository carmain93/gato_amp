import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gato/config/confi.dart';
import 'package:gato/pantallas/puntajes.dart';
import 'package:gato/widgets/zelda.dart';
class Controles extends StatefulWidget {
  const Controles({super.key});

  @override
  State<Controles> createState() => _ControlesState();
}

class _ControlesState extends State<Controles> {
  estados inicial=estados.cruz;


  @override
  Widget build(BuildContext context) {
    double ancho, alto;

    ancho= MediaQuery.of(context).size.width;
    alto=MediaQuery.of(context).size.height;


    return SizedBox(

      width: alto,
      height: ancho,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Expanded(child: Row(children: <Widget>[
            Celda(inicial: tablero[0],alto: alto/4,ancho: ancho/4 ,press: ()=>press(0),),
            Celda(inicial: tablero[1],alto: alto/4,ancho: ancho/4,press: ()=>press(1),),
            Celda(inicial: tablero[2],alto: alto/4,ancho: ancho/4,press: ()=>press(2),)
          ],

          ),
          ),
          Expanded(child: Row(children: <Widget>[
            Celda(inicial: tablero[3],alto: alto/4,ancho: ancho/4,press: ()=>press(3),),
            Celda(inicial: tablero[4],alto: alto/4,ancho: ancho/4,press: ()=>press(4),),
            Celda(inicial: tablero[5],alto: alto/4,ancho: ancho/4,press: ()=>press(5),)
          ],
          ),
          ),
          Expanded(child: Row(children: <Widget>[
            Celda(inicial: tablero[6],alto: alto/4,ancho: ancho/4,press: ()=>press(6),),
            Celda(inicial: tablero[7],alto: alto/4,ancho: ancho/4,press: ()=>press(7),),
            Celda(inicial: tablero[8],alto: alto/4,ancho: ancho/4,press: ()=>press(8),)
          ],
          ),
          ),
          Contador(),



        ],
      ),

    );
  }

  void press(int index) {

    if (tablero[index]==estados.vacio){//evita que una celda sea seleccionada 2 veces
      tablero[index]=inicial;
      inicial =inicial==estados.cruz ? estados.circulo:estados.cruz;
      setState(() {

      });

      if(++contador>=5){
        for(int i=0;i<tablero.length;i+=3){
          Iguales(i,i+1,i+2);
        }
        for(int i=0;i<3; i++ ){
          Iguales(i, i+3, i+6);
        }
        Iguales(0,4,8);
        Iguales(2, 4, 6);

      }
      if(contador==9){
        empate++;
        dialogo("Ocurrio un empate nadie gana");
        resetTablero();
      }
    }


  }
  void Iguales(int a, int b, int c) {
  String msj="";
    if (tablero[a] != estados.vacio) {
      if (tablero[a] == tablero[b] && tablero[b] == tablero[c]) {
        resultados[tablero[a]] = true;

        if (tablero[a] == estados.cruz) {
          puntosCruz++;
          msj="Cruzes ganan felicidades";
        } else {
          puntosCirculo++;
          msj="Circulos ganan felicidades";
        }

        dialogo(msj);
        resetTablero();
        setState(() {});

        print(resultados);

      }
    }

  }



  void resetTablero() {
    tablero = List.filled(9, estados.vacio);
    inicial = estados.cruz;
    contador = 0;
    resultados = {estados.cruz: false, estados.circulo: false};
    setState(() {});
  }

  void dialogo(String msj){
    showDialog(context: context, builder:(BuildContext context){
      return AlertDialog(
        title: Text(msj),
        content: Text("¿Deseas continuar o salir?"),
        actions: <Widget>[
          TextButton(
            child: Text("Continuar"),
            onPressed: () {
              Navigator.of(context).pop();

            },
          ),
          TextButton(
            child: Text("Salir"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Salir de la aplicación
            },
          ),
        ],
      );
    });
  }
}
