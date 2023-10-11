part of 'delete_seller_product_bloc.dart';

@immutable
abstract class DeleteSellerProductEvent {}
class FetchDeleteSellerProduct extends DeleteSellerProductEvent{
  final String productId;

  FetchDeleteSellerProduct({required this.productId});}
