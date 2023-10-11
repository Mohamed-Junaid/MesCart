part of 'get_seller_products_bloc.dart';

@immutable
abstract class GetSellerProductsState {}

class GetSellerProductsInitial extends GetSellerProductsState {}
class GetSellerProductsBlocLoading extends GetSellerProductsState {}
class GetSellerProductsBlocLoaded extends GetSellerProductsState {}
class GetSellerProductsBlocError extends GetSellerProductsState {}
