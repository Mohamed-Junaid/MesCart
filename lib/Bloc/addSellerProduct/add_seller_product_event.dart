part of 'add_seller_product_bloc.dart';

@immutable
abstract class AddSellerProductEvent {}
class FetchAddSellerProduct extends AddSellerProductEvent{
  final String name;
  final String cateId;
  final String price;
  final String description;
  final String stock;
  final List<File> selectedImages;
  FetchAddSellerProduct(
      {required this.name,required this.cateId,required this.price,required this.description,required this.stock,required this.selectedImages});
}
