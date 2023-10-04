part of 'verify_id_bloc.dart';

@immutable
abstract class VerifyIdState {}

class VerifyIdInitial extends VerifyIdState {}
class VerifyIdBlocLoading extends VerifyIdState {}
class VerifyIdBlocLoaded  extends VerifyIdState {}
class VerifyIdBlocError extends VerifyIdState {}
