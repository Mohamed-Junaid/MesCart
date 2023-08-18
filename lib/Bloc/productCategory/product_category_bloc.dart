import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mes_kart/Repository/modelclass/productCategoryModelclass.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  late ProductCategoryModelclass addProductModelclass;
  meskartApi meskart=meskartApi();
  ProductCategoryBloc() : super(ProductCategoryInitial()) {
    on<ProductCategoryEvent>((event, emit) async{
      emit(ProductCategoryBlocLoading());
      try{

        addProductModelclass = await meskart.getProductCategory();
        emit(ProductCategoryBlocLoaded());
      } catch(e){
        print(e);
        emit(ProductCategoryBlocError());}
    });

  }
}
