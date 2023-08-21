import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mes_kart/Repository/modelclass/CartPageModelclass.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'addto_cart_event.dart';
part 'addto_cart_state.dart';

class AddtoCartBloc extends Bloc<AddtoCartEvent, AddtoCartState> {

  meskartApi meskart=meskartApi();
  AddtoCartBloc() : super(AddtoCartInitial()) {
    on<FetchAddtoCart>((event, emit)async {
      emit(AddtoCartBlocLoading());
      try{
        await meskart.getAddtoCart(event.productId,event.quantity)  ;
        emit(AddtoCartBlocLoaded());
        ToastMessage().toastmessage(message:"Added Successfully");


      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(AddtoCartBlocError());}
    });
  }
}
