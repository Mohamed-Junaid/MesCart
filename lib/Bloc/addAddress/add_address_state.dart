part of 'add_address_bloc.dart';

@immutable
abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}
class AddAddressBlocLoading extends AddAddressState {}
class AddAddressBlocLoaded extends AddAddressState {}
class AddAddressBlocError extends AddAddressState {}


