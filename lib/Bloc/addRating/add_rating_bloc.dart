import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';
import '../../Ui/Widget/toast_message.dart';

part 'add_rating_event.dart';
part 'add_rating_state.dart';

class AddRatingBloc extends Bloc<AddRatingEvent, AddRatingState> {
  meskartApi meskart=meskartApi();
  AddRatingBloc() : super(AddRatingInitial()) {
    on<FetchAddRating>((event, emit) async {
      emit(AddRatingBlocLoading());
      try{
        await meskart.getAddRating(review: event.review, rate: event.rate, productId: event.productId) ;
        emit(AddRatingBlocLoaded());
        ToastMessage().toastmessage(message:"Review Added Successfully");
      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(AddRatingBlocError());}
    });
  }
}