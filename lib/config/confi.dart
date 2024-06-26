import 'package:flutter/material.dart';

enum estados{vacio,cruz,circulo}
List<estados> tablero = List.filled(9, estados.vacio);
Map<estados,bool> resultados={estados.cruz: false, estados.circulo: false};
int puntosCruz = 0;
int puntosCirculo = 0;
int empate=0;