import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'delete_seller_product_event.dart';
part 'delete_seller_product_state.dart';

class DeleteSellerProductBloc extends Bloc<DeleteSellerProductEvent, DeleteSellerProductState> {
  meskartApi meskart=meskartApi();
  DeleteSellerProductBloc() : super(DeleteSellerProductInitial())  {
    on<FetchDeleteSellerProduct>((event, emit)async {
      emit(DeleteSellerProductBlocLoading());
      try{
        await meskart.getDeleteSellerProduct(event.productId)  ;
        emit(DeleteSellerProductBlocLoaded());
        ToastMessage().toastmessage(message:'Product Deleted');

      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(DeleteSellerProductBlocError());}
    });
  }
}
