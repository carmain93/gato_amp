import 'package:flutter/material.dart';
import 'package:gato/config/confi.dart';
import 'package:gato/pantallas/puntajes.dart';

import 'controles.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        title: Text("gato no puedes pelear contra el sistema gato"),
        actions: [

          SizedBox(
            width: 20,
          ),
          PopupMenuButton(onSelected: (String result) {
            if (result == 'reiniciar') {

            } else if (result == 'salir') {
              dialogoSalir();
            }
          },

            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'reiniciar',
              child: Text('Reiniciar'),
            ),
            const PopupMenuItem<String>(
              value: 'salir',
              child: Text('Salir'),

            ),
          ],)
        ],
      ),
      body: Center(

        child: Stack(
          children: [

            Image.asset("imagenes/board.png",),
            Controles(),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Contador(),
            IconButton(onPressed:()=>{dialogoSalir()} , icon: Icon(Icons.access_time_filled_sharp) ,)
          ],
        ),

      ),

    );
  }
  void dialogoSalir(){
    showDialog(context: context, builder:(BuildContext context){
      return AlertDialog(
        title: Text("desea continuar y salir"),
        content: Text(""),
        actions: <Widget>[
          TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();

            },
          ),
          TextButton(
            child: Text("Continuar y salir"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}

