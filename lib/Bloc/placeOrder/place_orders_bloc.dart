import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';

part 'place_orders_event.dart';
part 'place_orders_state.dart';

class PlaceOrdersBloc extends Bloc<PlaceOrdersEvent, PlaceOrdersState> {
  meskartApi meskart=meskartApi();
  PlaceOrdersBloc() : super(PlaceOrdersInitial()) {
    on<FetchPlaceOrder>((event, emit) async{
      emit(PlaceOrdersBlocLoading());
      try{   await meskart.getPlaceOrder(productid: event.productid, quantity: event.quantity, deliveryId: event.deliveryId);
        emit(PlaceOrdersBlocLoaded());
      } catch(e){
        print(e);
        emit(PlaceOrdersBlocError());}
    });

  }
}
