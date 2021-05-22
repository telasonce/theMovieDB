import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/genres.dart';
import 'package:flutter_application_1/models/pelicula.dart';

Future<List<Pelicula>> obtenerPelicula() async {
  try {
    final respuesta = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b');

    final json = respuesta.data['results'];

    final respuestaGeneros = await Dio().get(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b');
    final jsonGeneros = respuestaGeneros.data['genres'];

    var listaGeneros =
        jsonGeneros.map((value) => Genres.fromJson(value)).toList();

    var listaPeliculas =
        json.map((value) => Pelicula.fromJson(value, listaGeneros)).toList();

    return List<Pelicula>.from(listaPeliculas);
  } catch (e) {
    return [];
  }
}
