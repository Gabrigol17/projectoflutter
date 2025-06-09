import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Modelo.dart';

class ApiService {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZGFlZDY5ODdlZjMwZjU4ZWJjMGQ5YzgxYzFhNDExNiIsIm5iZiI6MTc0OTMxODM2NC45MDEsInN1YiI6IjY4NDQ3YWRjOGIzYjM3OGQ5ZWZkNTZiMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mKVcLNkW1UJ7RufRGshE2LP3gsrd6eSCpzAoYyONFlk';

  // Obtener películas
  Future<List<Modelo>> obtenerPeliculas() async {
    final uri = Uri.parse('$_baseUrl/movie/popular').replace(queryParameters: {
      'language': 'es',
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
      // Asigna el tipo explícitamente como 'pelicula'
      return results.map((json) => Modelo.fromJson({...json, 'media_type': 'pelicula'})).toList();
    } else {
      throw Exception('Error al cargar películas');
    }
  }

  // Obtener series
  Future<List<Modelo>> obtenerSeries() async {
    final uri = Uri.parse('$_baseUrl/tv/popular').replace(queryParameters: {
      'language': 'es',
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
      // Asigna el tipo explícitamente como 'serie'
      return results.map((json) => Modelo.fromJson({...json, 'media_type': 'serie'})).toList();
    } else {
      throw Exception('Error al cargar series');
    }
  }
}
