part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchBlocLoading extends SearchState {}
class SearchBlocLoaded extends SearchState {}
class SearchBlocError extends SearchState {}
