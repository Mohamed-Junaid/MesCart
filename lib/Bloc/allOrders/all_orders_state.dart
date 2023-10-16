part of 'all_orders_bloc.dart';

@immutable
abstract class AllOrdersState {}

class AllOrdersInitial extends AllOrdersState {}
class AllOrdersBlocLoading extends AllOrdersState {}
class AllOrdersBlocLoaded extends AllOrdersState {}
class AllOrdersBlocError extends AllOrdersState {}
