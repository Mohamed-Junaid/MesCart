part of 'delete_address_bloc.dart';

@immutable
abstract class DeleteAddressEvent {}
class FetchDeleteAddress extends DeleteAddressEvent{
  final String addressId;

  FetchDeleteAddress({required this.addressId});
}
