import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Repository/modelclass/profileAddressModelclass.dart';

part 'profile_address_event.dart';
part 'profile_address_state.dart';

class ProfileAddressBloc extends Bloc<ProfileAddressEvent, ProfileAddressState> {
  late ProfileAddressModelclass addressModel;
  meskartApi meskart=meskartApi();
  ProfileAddressBloc() : super(ProfileAddressInitial()) {
    on<ProfileAddressEvent>((event, emit) async{
      emit(ProfileAddressBlocLoading());
      try{

        addressModel = await meskart.getProfileAddress();
        emit(ProfileAddressBlocLoaded());
      } catch(e){
        print(e);
        emit(ProfileAddressBlocError());}
    });
  }
}
