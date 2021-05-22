import 'package:flutter/material.dart';

class TextoBusquedaProvider with ChangeNotifier {
  String _textoBusqueda;

  TextoBusquedaProvider.init() {
    _textoBusqueda = '';
  }

  String get textoBusqueda {
    return _textoBusqueda;
  }

  set textoBusqueda(String texto) {
    _textoBusqueda = texto;
    notifyListeners();
  }
}
