part of 'delete_seller_product_bloc.dart';

@immutable
abstract class DeleteSellerProductState {}

class DeleteSellerProductInitial extends DeleteSellerProductState {}
class DeleteSellerProductBlocLoading extends DeleteSellerProductState {}
class DeleteSellerProductBlocLoaded extends DeleteSellerProductState {}
class DeleteSellerProductBlocError extends DeleteSellerProductState {}
