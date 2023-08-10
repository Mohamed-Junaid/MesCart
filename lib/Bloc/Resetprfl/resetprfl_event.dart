part of 'resetprfl_bloc.dart';

@immutable
abstract class ResetprflEvent {}
class Fetchresetprfl extends ResetprflEvent{
  final String username;
  final String phone;
  final String email;

  Fetchresetprfl({required this.username,required this.email,required this.phone,});
}
