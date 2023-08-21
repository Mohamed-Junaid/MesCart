import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'delete_cart_product_event.dart';
part 'delete_cart_product_state.dart';

class DeleteCartProductBloc extends Bloc<DeleteCartProductEvent, DeleteCartProductState> {
  meskartApi meskart=meskartApi();
  DeleteCartProductBloc() : super(DeleteCartProductInitial()) {
    on<FetchDeleteCartProduct>((event, emit)async {
      emit(DeleteCartProductLoading());
      try{
        await meskart.getDeleteCartProduct(event.productId)  ;
        emit(DeleteCartProductLoaded());
        ToastMessage().toastmessage(message:'Product Deleted');

      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(DeleteCartProductBlocError());}
    });
  }
}
