

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';

import '../../Ui/Widget/toast_message.dart';

part 'resetpswd_event.dart';
part 'resetpswd_state.dart';

class ResetpswdBloc extends Bloc<ResetpswdEvent, ResetpswdState> {
  meskartApi meskart=meskartApi();
  ResetpswdBloc() : super(ResetpswdInitial()) {
    on<Fetchresetpswd>((event, emit) async {
      emit(ResetpswdBlocLoading());
      try{
        await meskart.getresetpswd(newpassword:event.newpassword,oldpassword:event.oldpassword)  ;
        emit(ResetpswdBlocLoaded());
        ToastMessage().toastmessage(message:'Password Changed');

      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
      print(e);
      emit(ResetpswdBlocError());}
    });
  }
}
