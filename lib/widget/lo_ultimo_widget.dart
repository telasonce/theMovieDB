import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pelicula.dart';
import 'package:flutter_application_1/servicios/lo_ultimo_servicio.dart';
import 'package:flutter_application_1/widget/detalle_pelicula_widget.dart';

class LoUltimo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 12, left: 12),
          child: Text(
            'Lo último',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        FutureBuilder<Pelicula>(
          future: obtenerUltimaCreada(),
          builder: (context, snapshot) => snapshot.hasData
              ? Expanded(
                  child: DetallePeliculaWidget(snapshot.data),
                )
              : Center(
                  child: Text('Cargando...'),
                ),
        ),
      ],
    );
  }
}
