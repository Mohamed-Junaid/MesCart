part of 'cart_place_order_bloc.dart';

@immutable
abstract class CartPlaceOrderEvent {}
class FetchCartPlaceOrder extends CartPlaceOrderEvent {
  final List<Map<String,dynamic>> cartId;
  final String deliveryId;
  final  BuildContext context;
  FetchCartPlaceOrder( {required this.deliveryId,required this.cartId,required this.context});
}
