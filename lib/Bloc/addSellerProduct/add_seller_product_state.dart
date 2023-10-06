part of 'add_seller_product_bloc.dart';

@immutable
abstract class AddSellerProductState {}

class AddSellerProductInitial extends AddSellerProductState {}
class AddSellerProductBlocLoading extends AddSellerProductState {}
class AddSellerProductBlocLoaded extends AddSellerProductState {}
class AddSellerProductBlocError extends AddSellerProductState {}
