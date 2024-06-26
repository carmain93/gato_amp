import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gato/config/confi.dart';
import 'package:gato/widgets/zelda.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Cruz: $puntosCruz', style: TextStyle(fontSize: 20)),
          Text('Empates: $empate', style: TextStyle(fontSize: 20)),
          Text('Círculo: $puntosCirculo', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
