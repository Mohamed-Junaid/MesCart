

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Repository/modelclass/mesSigninModelclass.dart';
import '../../Ui/Widget/toast_message.dart';

part 'mes_signin_event.dart';
part 'mes_signin_state.dart';

class MesSigninBloc extends Bloc<MesSigninEvent, MesSigninState> {
  late MesSigninModelclass messigninModelclass;
  meskartApi meskart=meskartApi();
  MesSigninBloc() : super(MesSigninInitial()) {
    on<FetchmesSignin>((event, emit)  async {
      emit(MesSigninBlocLoading());
      try{

        messigninModelclass = await meskart.getmessignin(event.email,event.password)  ;
        emit(MesSigninBlocLoaded());
      } catch(e){ ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(MesSigninBlocError());}
      // TODO: implement event handler
    });
  }
}
