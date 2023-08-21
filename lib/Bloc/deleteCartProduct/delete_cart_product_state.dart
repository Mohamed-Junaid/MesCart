part of 'delete_cart_product_bloc.dart';

@immutable
abstract class DeleteCartProductState {}

class DeleteCartProductInitial extends DeleteCartProductState {}
class DeleteCartProductLoading extends DeleteCartProductState{}
class DeleteCartProductLoaded extends DeleteCartProductState {}
class DeleteCartProductBlocError extends DeleteCartProductState {}
