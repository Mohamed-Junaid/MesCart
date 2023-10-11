import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'update_seller_product_event.dart';
part 'update_seller_product_state.dart';

class UpdateSellerProductBloc extends Bloc<UpdateSellerProductEvent, UpdateSellerProductState> {
  meskartApi meskart=meskartApi();
  UpdateSellerProductBloc() : super(UpdateSellerProductInitial()) {
    on<FetchUpdateSellerProducts>((event, emit)   async {
      emit(UpdateSellerProductBlocLoading());
      try{
        await meskart.getUpdateSellerProduct(
            productId: event.productId,
            name: event.name,
            price: event.price,
            description: event.description,
            stock: event.stock, image: event.image,);
        emit(UpdateSellerProductBlocLoaded());
        ToastMessage().toastmessage(message:'Product Updated');

      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(UpdateSellerProductBlocError());}
    });
  }
}