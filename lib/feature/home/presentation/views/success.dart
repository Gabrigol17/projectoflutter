import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectoflutter/bloc/home_bloc.dart';
import 'package:projectoflutter/feature/home/presentation/views/fealure.dart';
import 'package:projectoflutter/feature/home/presentation/views/loading.dart';


class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            // Fondo de imagen
            SizedBox.expand(
              child: Image.asset(
                'assets/fondo.jpeg',
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
                    // Barra superior con filtro y tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.filter_list, color: Colors.white),
                          onSelected: (value) {
                            print('Filtro seleccionado: $value');
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'Populares',
                              child: Text('Populares', style: TextStyle(color: Colors.white)),
                            ),
                            const PopupMenuItem(
                              value: 'Recientes',
                              child: Text('Recientes', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBar(
                            indicatorColor: const Color(0xFFFFC300),
                            indicatorWeight: 3,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            tabs: const [
                              Tab(text: 'Películas'),
                              Tab(text: 'Series'),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.person, color: Colors.white),
                          onPressed: () {},
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

                    const SizedBox(height: 20),

                    Expanded(
                      child: BlocBuilder<HomeBloc, HomeState>( //BlocBuilder para la parte de los datos
                        builder: (context, state) {
                          if (state is HomeLoading) {
                            return Loading();
                          } else if (state is HomeFailure) {
                            return Failure();
                          } else if (state is HomeSuccess) {
                            final listaPeliculas = state.peliculas;
                            final listaSeries = state.series;

                            return TabBarView(
                              children: [
                                // Películas
                                GridView.builder(
                                  itemCount: listaPeliculas.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6,
                                  ),
                                  itemBuilder: (context, index) {
                                    final pelicula = listaPeliculas[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/data',
                                          arguments: pelicula,
                                        );
                                      },
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Image.network(pelicula.imagen ?? ''),
                                            Text(pelicula.titulo ?? ''),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                // Series
                                GridView.builder(
                                  itemCount: listaSeries.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6,
                                  ),
                                  itemBuilder: (context, index) {
                                    final serie = listaSeries[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/data',
                                          arguments: serie,
                                        );
                                      },
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Image.network(serie.imagen ?? ''),
                                            Text(serie.titulo ?? ''),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
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
