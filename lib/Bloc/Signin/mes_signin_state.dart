part of 'mes_signin_bloc.dart';

@immutable
abstract class MesSigninState {}

class MesSigninInitial extends MesSigninState {}
class MesSigninBlocLoading extends MesSigninState {}
class MesSigninBlocLoaded extends MesSigninState {}
class MesSigninBlocError extends MesSigninState {}
