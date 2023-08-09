part of 'mes_signin_bloc.dart';

@immutable
abstract class MesSigninEvent {}
class FetchmesSignin extends MesSigninEvent{

  final String email;
  final String password;

  FetchmesSignin({required this.email,required this.password});
}
