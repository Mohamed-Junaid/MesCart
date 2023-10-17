part of 'add_rating_bloc.dart';

@immutable
abstract class AddRatingEvent {}
class FetchAddRating extends AddRatingEvent{
  final String review;
  final int rate;
  final String productId;

  FetchAddRating( {required this.review,required this.rate,required this.productId,});

}