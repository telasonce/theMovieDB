import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/texto_busqueda_provider.dart';
import 'package:flutter_application_1/pages/pantalla_principal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextoBusquedaProvider>(
      create: (_) => TextoBusquedaProvider.init(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PantallaPrincipal(),
      ),
    );
  }
}
