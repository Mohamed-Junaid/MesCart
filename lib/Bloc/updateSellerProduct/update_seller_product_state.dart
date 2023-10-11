part of 'update_seller_product_bloc.dart';

@immutable
abstract class UpdateSellerProductState {}

class UpdateSellerProductInitial extends UpdateSellerProductState {}
class UpdateSellerProductBlocLoading extends UpdateSellerProductState {}
class UpdateSellerProductBlocLoaded extends UpdateSellerProductState {}
class UpdateSellerProductBlocError extends UpdateSellerProductState {}
