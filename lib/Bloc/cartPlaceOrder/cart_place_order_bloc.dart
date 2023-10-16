import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'cart_place_order_event.dart';
part 'cart_place_order_state.dart';

class CartPlaceOrderBloc extends Bloc<CartPlaceOrderEvent, CartPlaceOrderState> {
  meskartApi meskart=meskartApi();
  CartPlaceOrderBloc() : super(CartPlaceOrderInitial()) {
    on<FetchCartPlaceOrder>((event, emit) async {
      emit(CartPlaceOrderBlocLoading());
      try{
        await meskart.getCartPlaceOrder(deliveryId: event.deliveryId, cartId: event.cartId) ;
        emit(CartPlaceOrderBlocLoaded());
        // ToastMessage().toastmessage(message:'Order Placed');

      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(CartPlaceOrderBlocError());}
    });
  }
}