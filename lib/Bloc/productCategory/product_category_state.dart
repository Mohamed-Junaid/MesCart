part of 'product_category_bloc.dart';

@immutable
abstract class ProductCategoryState {}

class ProductCategoryInitial extends ProductCategoryState {}
class ProductCategoryBlocLoading extends ProductCategoryState {}
class ProductCategoryBlocLoaded extends ProductCategoryState {}
class ProductCategoryBlocError extends ProductCategoryState {}
