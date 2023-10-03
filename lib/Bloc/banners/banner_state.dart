part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}
class BannerBlocLoading extends BannerState {}
class BannerBlocLoaded extends BannerState {}
class BannerBlocError extends BannerState {}
