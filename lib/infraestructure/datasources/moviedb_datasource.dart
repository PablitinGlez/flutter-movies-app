import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mapers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.themovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    
    //implementacion
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    
    final List<Movie> movies= movieDBResponse.results
    .where((moviedb)=>moviedb.posterPath !='No poster')
    .map((moviedb)=>MovieMapper.movieDBToEntity(moviedb)).toList();

    //procesar la respuesta trabajamos con nuesta entidad movie
    //necesitamos un modelo para leer la data y un mapper para vconvertir el modelo en entiedad
  

    return movies;



  }

}