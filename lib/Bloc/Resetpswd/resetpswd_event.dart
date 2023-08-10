part of 'resetpswd_bloc.dart';

@immutable
abstract class ResetpswdEvent {}
class Fetchresetpswd extends ResetpswdEvent{

  final String newpassword;
  final String oldpassword;


  Fetchresetpswd({required this.oldpassword,required this.newpassword});
}
