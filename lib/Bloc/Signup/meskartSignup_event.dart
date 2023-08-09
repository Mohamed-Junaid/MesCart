part of 'meskartSignup_bloc.dart';

@immutable
abstract class MeskartEvent {}
class Fetchmeskart extends MeskartEvent{
  final String userName;
  final String email;
  final String password;
  final String phone;
  Fetchmeskart({required this.userName,required this.email,required this.password,required this.phone});
}
