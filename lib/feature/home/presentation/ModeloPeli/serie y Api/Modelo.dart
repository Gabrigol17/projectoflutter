import 'package:equatable/equatable.dart';

class Modelo extends Equatable {
  final int? id;
  final String? titulo;
  final String? descripcion;
  final String? imagen;
  final double? calificacion;
  final String? genero;
  final String? fechaLanzamiento;
  final String tipo;

  const Modelo({
    this.id,
    this.titulo,
    this.descripcion,
    this.imagen,
    this.calificacion,
    this.genero,
    this.fechaLanzamiento,
    required this.tipo
  });

  @override
  List<Object?> get props => [
        id,
        titulo,
        descripcion,
        imagen,
        calificacion,
        genero,
        fechaLanzamiento,
        tipo
      ];

  factory Modelo.fromJson(Map<String, dynamic> json) {
  return Modelo(
    id: json['id'],
    titulo: json['title'] ?? json['name'],
    descripcion: json['overview'],
    imagen: json['poster_path'] != null ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}' : '',
    calificacion: (json['vote_average'] ?? 0).toDouble(),
    genero: (json['genre_ids'] as List?)?.join(', ') ?? '',
    fechaLanzamiento: json['release_date'] ?? json['first_air_date'],
    tipo: json['media_type'] ?? (json['title'] != null ? 'pelicula' : 'serie'),
  );
}
}