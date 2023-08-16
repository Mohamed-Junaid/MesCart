part of 'profile_address_bloc.dart';

@immutable
abstract class ProfileAddressState {}

class ProfileAddressInitial extends ProfileAddressState {}
class ProfileAddressBlocLoading extends ProfileAddressState {}
class ProfileAddressBlocLoaded extends ProfileAddressState {}
class ProfileAddressBlocError extends ProfileAddressState {}
