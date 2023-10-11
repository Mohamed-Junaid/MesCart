import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Repository/modelclass/GetSellerProductsModel1.dart';



part 'get_seller_products_event.dart';
part 'get_seller_products_state.dart';

class GetSellerProductsBloc extends Bloc<GetSellerProductsEvent, GetSellerProductsState> {
  late GetSellerProductsModel1 getSellerProductsModel;
  meskartApi meskart=meskartApi();
  GetSellerProductsBloc() : super(GetSellerProductsInitial()) {
    on<GetSellerProductsEvent>((event, emit) async{
      emit(GetSellerProductsBlocLoading());
      try{
        getSellerProductsModel = await meskart.getSellerProductList();
        emit(GetSellerProductsBlocLoaded());
      } catch(e){
        print(e);
        emit(GetSellerProductsBlocError());}
    });

  }
}
