import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'delete_address_event.dart';
part 'delete_address_state.dart';

class DeleteAddressBloc extends Bloc<DeleteAddressEvent, DeleteAddressState> {
  meskartApi meskart=meskartApi();
  DeleteAddressBloc() : super(DeleteAddressInitial()) {
    on<FetchDeleteAddress>((event, emit) async {
      emit(DeleteAddressBlocLoading());
      try{
        await meskart.getDeleteAddress(event.addressId)  ;
        emit(DeleteAddressBlocLoaded());
        ToastMessage().toastmessage(message:'Address Deleted');

      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(DeleteAddressBlocError());}
    });
  }
}
