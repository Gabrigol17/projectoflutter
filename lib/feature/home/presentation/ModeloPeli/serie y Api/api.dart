import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Modelo.dart';

class ApiService {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZGFlZDY5ODdlZjMwZjU4ZWJjMGQ5YzgxYzFhNDExNiIsIm5iZiI6MTc0OTMxODM2NC45MDEsInN1YiI6IjY4NDQ3YWRjOGIzYjM3OGQ5ZWZkNTZiMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mKVcLNkW1UJ7RufRGshE2LP3gsrd6eSCpzAoYyONFlk';

  Future<List<Modelo>> obtenerContenidoFiltrado({
    String tipo = 'movie',            
    int? genero,                       
    double? valoracionMinima,         
    bool masPopular = true,          
    String? fechaDesde,               
  }) async {
    String endpoint = masPopular ? 'popular' : 'top_rated';
    final uri = Uri.parse('$_baseUrl/$tipo/$endpoint').replace(queryParameters: {
      'language': 'es',
      if (genero != null) 'with_genres': genero.toString(),
      if (valoracionMinima != null) 'vote_average.gte': valoracionMinima.toString(),
      if (fechaDesde != null)
        tipo == 'movie'
            ? 'primary_release_date.gte'
            : 'first_air_date.gte': fechaDesde,
    });

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $_accessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List results = body['results'];
      return results.map((json) => Modelo.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar contenido');
    }
  }
}
