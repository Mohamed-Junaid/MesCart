import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'profile_image_event.dart';
part 'profile_image_state.dart';

class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  meskartApi meskart=meskartApi();
  ProfileImageBloc() : super(ProfileImageInitial()) {
    on<FetchProfileImage>((event, emit)async {
      emit(ProfileImageBlocLoading());
      try{
        await meskart.getProfileImage(event.filePath)  ;
        emit(ProfileImageBlocLoaded());
        ToastMessage().toastmessage(message:"Image Updated Successfully");
      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(ProfileImageBlocError());}
    });
  }
}