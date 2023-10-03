part of 'get_aproduct_bloc.dart';

@immutable
abstract class GetAproductEvent {}
class FetchGetaProdcuct extends GetAproductEvent{
  final String ProductId;

  FetchGetaProdcuct( {required this.ProductId,});
}
