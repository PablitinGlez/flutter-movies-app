import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
//no kiero crear instancias de ella
//este clasdefine que es lo que los metos que estas clases van a tener para traer esta data
//getnowplaingmovies    

    Future<List<Movie>> getNowPlaying({int page =1});


}

