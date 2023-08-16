import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  meskartApi meskart=meskartApi();
  AddAddressBloc() : super(AddAddressInitial()) {
    on<FetchaddAddress>((event, emit)async {
      emit(AddAddressBlocLoading());
      try{
        await meskart.getaddAddress(event.fullname,event.phonenumber,event.pincode,event.state,event.city,
            event.houseNoOrBuildingName,event.roadname,event.landmark,event.addressType)  ;
        emit(AddAddressBlocLoaded());
        ToastMessage().toastmessage(message:"Added Successfully");


      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(AddAddressBlocError());}
    });
  }
}
