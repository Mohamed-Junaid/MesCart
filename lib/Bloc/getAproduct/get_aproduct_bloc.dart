import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Repository/modelclass/GetAproductModelclass.dart';
import '../../Ui/Widget/toast_message.dart';

part 'get_aproduct_event.dart';
part 'get_aproduct_state.dart';

class GetAproductBloc extends Bloc<GetAproductEvent, GetAproductState> {
  meskartApi meskart=meskartApi();
  late GetAproductModelclass getAproductModelclass;
  GetAproductBloc() : super(GetAproductInitial()) {
    on<FetchGetaProdcuct>((event, emit)  async {
      emit(GetAproductBlocLoading());
      try{
        getAproductModelclass = await meskart.getAproduct(event.ProductId) ;
        emit(GetAproductBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(GetAproductBlocError());}
    });
  }
}

