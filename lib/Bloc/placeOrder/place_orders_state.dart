part of 'place_orders_bloc.dart';

@immutable
abstract class PlaceOrdersState {}

class PlaceOrdersInitial extends PlaceOrdersState {}
class PlaceOrdersBlocLoading extends PlaceOrdersState {}
class PlaceOrdersBlocLoaded extends PlaceOrdersState {}
class PlaceOrdersBlocError extends PlaceOrdersState {}
