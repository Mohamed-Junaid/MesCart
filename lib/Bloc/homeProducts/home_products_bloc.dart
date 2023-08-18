import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mes_kart/Repository/modelclass/homeProductsModelclass.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';

part 'home_products_event.dart';
part 'home_products_state.dart';

class HomeProductsBloc extends Bloc<HomeProductsEvent, HomeProductsState> {
  late HomeProductsModelclass homeProductsModelclass;
  meskartApi meskart=meskartApi();
  HomeProductsBloc() : super(HomeProductsInitial()) {
    on<HomeProductsEvent>((event, emit) async{
      emit(HomeProductsBlocLoading());
      try{

        homeProductsModelclass = await meskart.getHomeProducts();
        emit(HomeProductsBlocLoaded());
      } catch(e){
        print(e);
        emit(HomeProductsBlocError());}
    });

  }
}
