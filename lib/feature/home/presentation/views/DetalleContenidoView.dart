import 'package:flutter/material.dart';
import 'package:projectoflutter/feature/home/presentation/ModeloPeli/serie%20y%20Api/Modelo.dart';

class DetalleContenidoView extends StatelessWidget {
  final Modelo contenido;

  const DetalleContenidoView({super.key, required this.contenido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contenido.titulo ?? 'Sin título'),
      ),
      // Resto del contenido...
    );
  }
}
