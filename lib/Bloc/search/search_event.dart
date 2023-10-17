part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class FetchSearch extends SearchEvent{
  final String value1;
  FetchSearch({required this.value1});
}