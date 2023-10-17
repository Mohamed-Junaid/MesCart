part of 'add_rating_bloc.dart';

@immutable
abstract class AddRatingState {}

class AddRatingInitial extends AddRatingState {}
class AddRatingBlocLoading extends AddRatingState {}
class AddRatingBlocLoaded extends AddRatingState {}
class AddRatingBlocError extends AddRatingState {}