part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
   final List<Modelo> modelos;

  const HomeSuccess({required this.modelos});

  @override
  List<Object> get props => [modelos];
}
final class HomeFailure extends HomeState {
  final String mensaje;
  HomeFailure({required this.mensaje});
}
