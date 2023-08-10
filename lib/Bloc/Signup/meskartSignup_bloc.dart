import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Repository/modelclass/mesSignupModelclass.dart';
import '../../Ui/Widget/toast_message.dart';



part 'meskartSignup_event.dart';
part 'meskartSignup_state.dart';

class MeskartBloc extends Bloc<MeskartEvent, MeskartState> {
  late MesSignupModelclass meskartModelclass;
  meskartApi meskart=meskartApi();
  MeskartBloc() : super(MeskartInitial()) {
    on<Fetchmeskart>((event, emit) async {
      emit(MeskartBlocLoading());
      try{

        meskartModelclass = await meskart.getmeskart(event.userName,event.email,event.phone,event.password);
        emit(MeskartBlocLoaded());
      } catch(e){
        print(e);
        ToastMessage().toastmessage(message:e.toString());
        emit(MeskartBlocError());}
      // TODO: implement event handler
    });
  }
}
