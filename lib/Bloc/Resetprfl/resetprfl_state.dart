part of 'resetprfl_bloc.dart';

@immutable
abstract class ResetprflState {}

class ResetprflInitial extends ResetprflState {}
class ResetprflBlocLoading extends ResetprflState {}
class ResetprflBlocLoaded extends ResetprflState {}
class ResetprflBlocError extends ResetprflState {}
