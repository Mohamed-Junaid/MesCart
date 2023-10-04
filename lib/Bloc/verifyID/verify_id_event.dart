part of 'verify_id_bloc.dart';

@immutable
abstract class VerifyIdEvent {}
class FetchVerifyId extends VerifyIdEvent{
  final File file;

  FetchVerifyId( {required this.file,});
}
