import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mes_kart/Repository/modelclass/BannerModelclass.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  meskartApi meskart=meskartApi();
  late BannerModelclass bannerModelclass;
  BannerBloc() : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      emit(BannerBlocLoading());
      try{
        bannerModelclass = await meskart.getBanners() ;
        emit(BannerBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(BannerBlocError());}
    });
    }
        }
