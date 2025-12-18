import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  //aca llamos al datasource para que nos traiga la data de peliculas 
  //ejemplo quiero la lista de peliculas que estan en cines

  Future<List<Movie>> getNowPlaying({int page = 1});
}
