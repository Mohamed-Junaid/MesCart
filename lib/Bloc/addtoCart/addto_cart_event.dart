part of 'addto_cart_bloc.dart';

@immutable
abstract class AddtoCartEvent {}
class FetchAddtoCart extends AddtoCartEvent{
  final String productId;
  final int quantity;

  FetchAddtoCart({required this.productId,required this.quantity});
}
