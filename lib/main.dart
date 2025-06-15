import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectoflutter/bloc/home_bloc.dart';
import 'package:projectoflutter/feature/home/presentation/ModeloPeli/serie%20y%20Api/Modelo.dart';
import 'package:projectoflutter/feature/home/presentation/ModeloPeli/serie%20y%20Api/api.dart';
import 'package:projectoflutter/feature/home/presentation/views/DetalleContenidoView.dart';
import 'package:projectoflutter/feature/home/presentation/views/fealure.dart';
import 'package:projectoflutter/feature/home/presentation/views/initial.dart';
import 'package:projectoflutter/feature/home/presentation/views/loading.dart';
import 'package:projectoflutter/feature/home/presentation/views/success.dart';


void main() {
  runApp(
    MultiBlocProvider( // Usamos MultiBlocProvider para manejar múltiples Blocs si es necesario
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(apiService: ApiService()), // Proveedor del Bloc de inicio, elegimos el servicio API
        ),
      ],
      child: MyApp(), // Aplicación principal
    ),
  );
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => Inicial_view(), // Vista inicial
        '/loading': (context) => Loading(), // Vista de carga
        '/success': (context) => Success(), // Vista de éxito
        '/failure': (context) => Failure(), // Vista de fallo
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/data'){
          final contenido = settings.arguments as Modelo;
          return MaterialPageRoute(
            builder: (context) => DetalleContenidoView(contenido: contenido), // Pasamos los datos a la vista de éxito
          );
        }
        return null; // Si no hay coincidencia, devolvemos null
      },
    );
  }
}
