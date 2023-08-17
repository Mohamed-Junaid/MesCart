part of 'delete_address_bloc.dart';

@immutable
abstract class DeleteAddressState {}

class DeleteAddressInitial extends DeleteAddressState {}
class DeleteAddressBlocLoading extends DeleteAddressState {}
class DeleteAddressBlocLoaded extends DeleteAddressState {}
class DeleteAddressBlocError extends DeleteAddressState {}
