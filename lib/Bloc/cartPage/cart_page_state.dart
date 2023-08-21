part of 'cart_page_bloc.dart';

@immutable
abstract class CartPageState {}

class CartPageInitial extends CartPageState {}
class CartPageBlocLoading extends CartPageState {}
class CartPageBlocLoaded extends CartPageState {}
class CartPageBlocError extends CartPageState {}