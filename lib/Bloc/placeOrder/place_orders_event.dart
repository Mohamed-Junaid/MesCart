part of 'place_orders_bloc.dart';

@immutable
abstract class PlaceOrdersEvent {}
class FetchPlaceOrder extends PlaceOrdersEvent {
  final String productid;
  final String deliveryId;
  final int quantity;
  final  BuildContext context;
  FetchPlaceOrder( {required this.context,required this.productid,required this.quantity,required this.deliveryId, });
}