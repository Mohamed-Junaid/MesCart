part of 'get_aproduct_bloc.dart';

@immutable
abstract class GetAproductState {}

class GetAproductInitial extends GetAproductState {}
class GetAproductBlocLoading extends GetAproductState {}
class GetAproductBlocLoaded extends GetAproductState {}
class GetAproductBlocError extends GetAproductState {}