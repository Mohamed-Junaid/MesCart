
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'resetprfl_event.dart';
part 'resetprfl_state.dart';

class ResetprflBloc extends Bloc<ResetprflEvent, ResetprflState> {
  meskartApi meskart=meskartApi();
  ResetprflBloc() : super(ResetprflInitial()) {
    on<Fetchresetprfl>((event, emit)async {
      emit(ResetprflBlocLoading());
      try{
        await meskart.getresetprfl(event.username,event.email,event.phone)  ;
        emit(ResetprflBlocLoaded());


      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(ResetprflBlocError());}
    });
  }
}
