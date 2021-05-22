import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/models/pelicula.dart';
import 'package:flutter_application_1/pages/detalle_pelicula.dart';
import 'package:flutter_application_1/servicios/peliculas_servicio.dart';
import 'package:flutter_application_1/widget/fila_pelicula_widget.dart';

class MasPopularesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 12, left: 12),
          child: Text(
            'Peliculas populares',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        FutureBuilder<List<Pelicula>>(
          future: obtenerPelicula(),
          builder: (context, snapshot) => snapshot.hasData
              ? Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetallePelicula(
                            snapshot.data[index],
                          ),
                        ),
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: FilaPeliculaWidget(
                          data: snapshot.data[index],
                        ),
                      ),
                    ),
                    itemCount: snapshot.data.length,
                  ),
                )
              : Center(
                  child: Text('Cargando...'),
                ),
        ),
      ],
    );
  }
}
