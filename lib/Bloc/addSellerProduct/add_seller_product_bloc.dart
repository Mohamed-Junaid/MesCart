import 'dart:async';
import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'add_seller_product_event.dart';
part 'add_seller_product_state.dart';

class AddSellerProductBloc extends Bloc<AddSellerProductEvent, AddSellerProductState> {
  meskartApi meskart=meskartApi();
  AddSellerProductBloc() : super(AddSellerProductInitial()) {
    on<FetchAddSellerProduct>((event, emit) async {
      emit(AddSellerProductBlocLoading());
      try{
        await meskart.getAddSellerProduct(selectedImages: event.selectedImages, name: event.name, cateId: event.cateId, price: event.price,
            description: event.description, stock: event.stock)  ;
        emit(AddSellerProductBlocLoaded());
        ToastMessage().toastmessage(message:" Created SuccessFully");


      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(AddSellerProductBlocError());}
    });
  }
}
