part of 'cart_place_order_bloc.dart';

@immutable
abstract class CartPlaceOrderState {}

class CartPlaceOrderInitial extends CartPlaceOrderState {}
class CartPlaceOrderBlocLoading extends CartPlaceOrderState {}
class CartPlaceOrderBlocLoaded extends CartPlaceOrderState {}
class CartPlaceOrderBlocError extends CartPlaceOrderState {}