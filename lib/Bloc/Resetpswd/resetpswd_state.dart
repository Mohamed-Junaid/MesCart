part of 'resetpswd_bloc.dart';

@immutable
abstract class ResetpswdState {}

class ResetpswdInitial extends ResetpswdState {}
class ResetpswdBlocLoading extends ResetpswdState {}
class ResetpswdBlocLoaded extends ResetpswdState {}
class ResetpswdBlocError extends ResetpswdState {}
