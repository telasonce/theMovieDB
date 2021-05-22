class Pelicula {
  Pelicula({
    this.title,
    this.genreIds,
    this.genreNames,
    this.overview,
    this.posterPath,
  });

  factory Pelicula.fromJson(
      Map<String, dynamic> json, List<dynamic> listaGeneros) {
    final title = json['title'];
    final genreIds = json['genre_ids'];
    final overview = json['overview'];
    final posterPath = json['poster_path'];
    final genreNames = [];

    if (genreIds != null) {
      for (var item in genreIds) {
        var r = listaGeneros.firstWhere((element) => element.id == item,
            orElse: () => null);
        var name = r.name;
        genreNames.add(name);
      }
    }

    return Pelicula(
      title: title,
      genreIds: genreIds,
      genreNames: genreNames,
      overview: overview,
      posterPath: posterPath,
    );
  }

  final String title;
  final List<dynamic> genreIds;
  final String overview;
  final String posterPath;
  final List<dynamic> genreNames;
}
