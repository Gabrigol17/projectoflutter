import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Películas y Series
      child: Scaffold(
        body: Stack(
          children: [
            // Fondo de imagen
            SizedBox.expand(
              child: Image.asset(
                'assets/images/background_cinema.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Capa oscura
            Container(
              color: Colors.black.withOpacity(0.6),
            ),

            // Contenido principal
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    // Barra superior con filtro, tabs y usuario
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Botón de menú desplegable (filtros)
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.filter_list, color: Colors.white),
                          color: Colors.black87,
                          onSelected: (value) {
                            print('Filtro seleccionado: $value');
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'Populares',
                              child: Text('Populares', style: TextStyle(color: Colors.white)),
                            ),
                            PopupMenuItem(
                              value: 'Recientes',
                              child: Text('Recientes', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),

                        // TabBar centrado
                        Expanded(
                          child: TabBar(
                            indicatorColor: const Color(0xFFFFC300),
                            indicatorWeight: 3,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                            tabs: const [
                              Tab(text: 'Películas'),
                              Tab(text: 'Series'),
                            ],
                          ),
                        ),

                        // Icono de usuario
                        IconButton(
                          icon: const Icon(Icons.person, color: Colors.white),
                          onPressed: () {
                            // Acción de usuario
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Cuadro de búsqueda
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Buscar películas o series...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
