import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pelicula.dart';
import 'package:flutter_application_1/servicios/get_peliculas_by_name.dart';
import 'package:flutter_application_1/widget/fila_pelicula_widget.dart';

class MostrarPeliculas extends StatelessWidget {
  final peliculasService = new PeliculasService();
  final name;

  MostrarPeliculas({this.name});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: peliculasService.getPeliculasByName(name),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? snapshot.data.length == 0
                    ? Text('No hay coincidencias')
                    : _showPeliculas(snapshot.data)
                : Text('Cargando...'));
  }
}

Widget _showPeliculas(List<Pelicula> peliculas) {
  return Expanded(
    child: ListView.builder(
      itemCount: peliculas.length,
      itemBuilder: (context, i) {
        final pelicula = peliculas[i];
        return FilaPeliculaWidget(
          data: pelicula,
        );
      },
    ),
  );
}
