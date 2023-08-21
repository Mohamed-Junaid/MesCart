part of 'delete_cart_product_bloc.dart';

@immutable
abstract class DeleteCartProductEvent {}
class FetchDeleteCartProduct extends DeleteCartProductEvent{
  final String productId;

  FetchDeleteCartProduct({required this.productId});
}
