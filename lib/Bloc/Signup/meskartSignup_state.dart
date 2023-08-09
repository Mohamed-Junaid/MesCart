part of 'meskartSignup_bloc.dart';

@immutable
abstract class MeskartState {}

class MeskartInitial extends MeskartState {}
class MeskartBlocLoading extends MeskartState {}
class MeskartBlocLoaded extends MeskartState {}
class MeskartBlocError extends MeskartState {}
