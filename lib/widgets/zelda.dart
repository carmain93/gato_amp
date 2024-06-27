
import 'package:gato/config/confi.dart';

class Celda extends StatelessWidget {
  final estados inicial;
  final double alto;
  final double ancho;
  final Function() press;
  const Celda({required this.inicial, required this.alto, required this.ancho, required this.press, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CupertinoButton(
        onPressed: press,
        child: mostrar(),
      ),
    );
  }

  Widget mostrar() {
    if (inicial == estados.vacio) {
      return SizedBox(height: alto, width: ancho);
    }
    if (inicial == estados.circulo) {
      return SizedBox(
        height: alto,
        width: ancho,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset("resources/imagenes/o.png"),
        ),
      );
    } else {
      return SizedBox(
        height: alto,
        width: ancho,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset("resources/imagenes/x.png"),
        ),
      );
    }
  }
}

