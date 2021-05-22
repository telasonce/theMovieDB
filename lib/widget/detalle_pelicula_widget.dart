import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pelicula.dart';

class DetallePeliculaWidget extends StatelessWidget {
  final Pelicula pelicula;

  const DetallePeliculaWidget(this.pelicula);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          pelicula.posterPath != null
              ? Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: pelicula.posterPath != null
                      ? Image.network(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${pelicula.posterPath}',
                          fit: BoxFit.fitWidth,
                        )
                      : Center(
                          child: Text(
                            'IMAGEN NO DISPONIBLE',
                          ),
                        ),
                )
              : Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'IMAGEN NO DISPONIBLE',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 30),
            child: Text(
              //TITULO
              '${pelicula.title}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.yellow,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 20),
            child: Text(
              'Información general',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              //OVERVIEW
              pelicula.overview,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50),
            child: pelicula.genreIds != []
                ? Text(
                    pelicula.genreNames.join(', '),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                : Text(''),
          ),
        ],
      ),
    );
  }
}
