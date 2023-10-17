part of 'profile_image_bloc.dart';

@immutable
abstract class ProfileImageEvent {}
class FetchProfileImage extends ProfileImageEvent {

  final  File filePath;

  FetchProfileImage({required this.filePath,});
}