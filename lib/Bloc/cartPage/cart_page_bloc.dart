import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Repository/modelclass/CartPageModelclass.dart';
import '../../Ui/Widget/toast_message.dart';

part 'cart_page_event.dart';
part 'cart_page_state.dart';

class CartPageBloc extends Bloc<CartPageEvent, CartPageState> {
  meskartApi meskart=meskartApi();
  late CartPageModelclass cartPageModelclass;
  CartPageBloc() : super(CartPageInitial()) {
    on<CartPageEvent>((event, emit) async {
      emit(CartPageBlocLoading());
      try{
        cartPageModelclass = await meskart.getCartPage() ;
        emit(CartPageBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(CartPageBlocError());}
    });
  }
}
