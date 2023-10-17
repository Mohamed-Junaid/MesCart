part of 'profile_image_bloc.dart';

@immutable
abstract class ProfileImageState {}

class ProfileImageInitial extends ProfileImageState {}
class ProfileImageBlocLoading extends ProfileImageState {}
class ProfileImageBlocLoaded extends ProfileImageState {}
class ProfileImageBlocError extends ProfileImageState {}
