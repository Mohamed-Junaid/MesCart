part of 'addto_cart_bloc.dart';

@immutable
abstract class AddtoCartState {}

class AddtoCartInitial extends AddtoCartState {}
class AddtoCartBlocLoading extends AddtoCartState {}
class AddtoCartBlocLoaded extends AddtoCartState {}
class AddtoCartBlocError extends AddtoCartState {}
