part of 'create_seller_ac_bloc.dart';

@immutable
abstract class CreateSellerAcState {}

class CreateSellerAcInitial extends CreateSellerAcState {}
class CreateSellerAcBlocLoading extends CreateSellerAcState {}
class CreateSellerAcBlocLoaded extends CreateSellerAcState {}
class CreateSellerAcBlocError extends CreateSellerAcState {}

