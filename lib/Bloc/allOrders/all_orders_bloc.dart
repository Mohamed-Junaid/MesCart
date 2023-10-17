import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Repository/modelclass/AllOrdersModel.dart';
import '../../Ui/Widget/toast_message.dart';

part 'all_orders_event.dart';
part 'all_orders_state.dart';

class AllOrdersBloc extends Bloc<AllOrdersEvent, AllOrdersState> {
  late AllOrdersModel getAllOrder;
  meskartApi meskart=meskartApi();
  AllOrdersBloc() : super(AllOrdersInitial()) {
    on<FetchGetAllOrders>((event, emit)async {
      emit(AllOrdersBlocLoading());
      try{
        getAllOrder= await meskart.getAllOrders();
        emit(AllOrdersBlocLoaded());
      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(AllOrdersBlocError());}
    });
  }
}