part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  final List<Modelo> peliculas;
  final List<Modelo> series;

  const HomeSuccess({required this.peliculas, required this.series});

  @override
  List<Object> get props => [peliculas, series];
}

final class HomeFailure extends HomeState {
  final String mensaje;
  HomeFailure({required this.mensaje});
}
