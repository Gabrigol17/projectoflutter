import 'package:flutter/material.dart';
import 'package:projectoflutter/feature/home/presentation/ModeloPeli/serie%20y%20Api/Modelo.dart';

class DetalleContenidoView extends StatelessWidget {
  final Modelo contenido;

  const DetalleContenidoView({super.key, required this.contenido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: Text(contenido.titulo ?? 'Sin título'), backgroundColor: Colors.deepPurple),
  body: Stack(
    children: [
      // Fondo de imagen
      SizedBox.expand(
        child: Image.asset(
          'assets/fondo1.jpg',
          fit: BoxFit.cover, // cubre toda la pantalla
        ),
      ),

      // Capa de oscurecimiento opcional (para mejorar contraste del texto)
      Container(
        color: Colors.black.withOpacity(0.3), // ajuste si quieres
      ),

      // Contenido real (scrollable)
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (contenido.imagen != null)
                Image.network(contenido.imagen!, height: 300, fit: BoxFit.cover),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      contenido.titulo ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Para que contraste con el fondo
                      ),
                    ),
                  ),
                  Chip(
                    label: Text(
                      contenido.tipo.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.deepPurple,
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Text(
                'Estreno: ${contenido.fechaLanzamiento ?? 'Desconocida'}',
                style: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    '${contenido.calificacion ?? 'N/A'}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Chip(
                label: Text(contenido.genero ?? 'Sin género'),
                backgroundColor: Colors.deepPurple,
                labelStyle: const TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 16),
              Text(
                contenido.descripcion ?? 'Sin descripción disponible.',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
  }
}