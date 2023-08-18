part of 'home_products_bloc.dart';

@immutable
abstract class HomeProductsState {}

class HomeProductsInitial extends HomeProductsState {}
class HomeProductsBlocLoading extends HomeProductsState {}
class HomeProductsBlocLoaded extends HomeProductsState {}
class HomeProductsBlocError extends HomeProductsState {}
