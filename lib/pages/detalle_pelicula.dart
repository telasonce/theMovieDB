import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pelicula.dart';
import 'package:flutter_application_1/widget/detalle_pelicula_widget.dart';

class DetallePelicula extends StatelessWidget {
  DetallePelicula(this.pelicula);
  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalle'),
        ),
        body: DetallePeliculaWidget(pelicula));
  }
}
