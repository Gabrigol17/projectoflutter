import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projectoflutter/feature/home/presentation/ModeloPeli/serie%20y%20Api/Modelo.dart';
import 'package:projectoflutter/feature/home/presentation/ModeloPeli/serie%20y%20Api/api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({required this.apiService}) : super(HomeInitial()) {
    on<CargaDeContenido>((event, emit) async {
      emit(HomeLoading());
      try {
        final peliculas = await apiService.obtenerPeliculas();  // Obtiene películas y series de forma separada
        final series = await apiService.obtenerSeries();
        
        // Emite éxito con ambas listas
        emit(HomeSuccess(peliculas: peliculas, series: series));
      } catch (error) {
        emit(HomeFailure(mensaje: 'Error al cargar el contenido'));
      }
    });
  }
}