import 'package:flutter/material.dart';
export 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:gato/widgets/zelda.dart';
export  'package:gato/widgets/zelda.dart';
import 'package:gato/widgets/puntajes.dart';
export 'package:gato/widgets/puntajes.dart';
import 'package:gato/pantallas/home.dart';
export 'package:gato/pantallas/home.dart';
import 'package:gato/pantallas/app.dart';
export 'package:gato/pantallas/app.dart';

enum estados{vacio,cruz,circulo}
List<estados> tablero = List.filled(9, estados.vacio);
Map<estados,bool> resultados={estados.cruz: false, estados.circulo: false};
int puntosCruz = 0;
int puntosCirculo = 0;
int empate=0;
int contador=0;