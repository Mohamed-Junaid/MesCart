part of 'update_seller_product_bloc.dart';

@immutable
abstract class UpdateSellerProductEvent {}
class FetchUpdateSellerProducts extends UpdateSellerProductEvent {
  final String productId;
  final String name;
  final int price;
  final String description;
  final int stock;
  final List <File> image;


  FetchUpdateSellerProducts( {
    required this.image,
    required this.productId,
    required this.name,
    required this.price,
    required this.description,
    required this.stock, required BuildContext context,
  });
}