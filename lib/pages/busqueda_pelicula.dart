import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/mostrar_peliculas_busqueda_widget.dart';
import 'package:flutter_application_1/widget/menu_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/texto_busqueda_provider.dart';

class BusquedaPelicula extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Movie DB',
        ),
      ),
      drawer: Menu(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                  controller: _controller,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Provider.of<TextoBusquedaProvider>(context,
                                  listen: false)
                              .textoBusqueda = _controller.text;
                        } //mostrar peli,
                        ),

                    labelText: 'Busca tu película',
                    labelStyle: TextStyle(fontSize: 18),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  onSubmitted: (texto) {
                    Provider.of<TextoBusquedaProvider>(context, listen: false)
                        .textoBusqueda = _controller.text;
                  } //mostrar peliculas,
                  ),
            ),
            SizedBox(
              height: 12,
            ),
            Provider.of<TextoBusquedaProvider>(context, listen: true)
                        .textoBusqueda !=
                    ''
                ? MostrarPeliculas(
                    name: Provider.of<TextoBusquedaProvider>(context,
                            listen: true)
                        .textoBusqueda,
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
