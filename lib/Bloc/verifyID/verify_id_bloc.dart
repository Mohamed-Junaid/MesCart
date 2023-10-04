import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';


part 'verify_id_event.dart';
part 'verify_id_state.dart';

class VerifyIdBloc extends Bloc<VerifyIdEvent, VerifyIdState> {
  meskartApi meskart=meskartApi();
  VerifyIdBloc() : super(VerifyIdInitial()) {
    on<FetchVerifyId>((event, emit) async {
      emit(VerifyIdBlocLoading());
      try{
        await meskart.getVerifyId(event.file);
        emit(VerifyIdBlocLoaded());
        ToastMessage().toastmessage(message:'Verified Successfully');

      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(VerifyIdBlocError());}
    });
  }
}