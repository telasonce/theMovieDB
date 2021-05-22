import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pantalla_principal.dart';
import 'package:flutter_application_1/pages/busqueda_pelicula.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaPrincipal(),
                ));
          },
        ),
        ListTile(
          title: Text('Buscar Peliculas'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BusquedaPelicula(),
                ));
          },
        ),
      ]),
    );
  }
}
