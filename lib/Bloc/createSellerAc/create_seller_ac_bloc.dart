import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'create_seller_ac_event.dart';
part 'create_seller_ac_state.dart';

class CreateSellerAcBloc extends Bloc<CreateSellerAcEvent, CreateSellerAcState> {
  meskartApi meskart=meskartApi();
  CreateSellerAcBloc() : super(CreateSellerAcInitial()) {
    on<FetchCreateSellerAc>((event, emit)async {
      emit(CreateSellerAcBlocLoading());
      try{
        await meskart.getCreateSellerAc(event.name,event.contactNumber,event.aadhar,event.email,event.collegeName,
            event.collegePlace,event.course,event.academicYear,event.admissionNumber,event.storePin)  ;
        emit(CreateSellerAcBlocLoaded());
        ToastMessage().toastmessage(message:"Created Successfully");


      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(CreateSellerAcBlocError());}
    });
  }
}
