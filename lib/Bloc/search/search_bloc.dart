import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mes_kart/Repository/modelclass/searchModel.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/mesApi/mesApi.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late SearchModel searchModel;
  meskartApi meskart=meskartApi();
  SearchBloc() : super(SearchInitial()) {
    on<FetchSearch>((event, emit) async{
      emit(SearchBlocLoading());
      try{

        searchModel = await meskart.getSearch(value: event.value1);
        emit(SearchBlocLoaded());
      } catch(e){
        print(e);
        emit(SearchBlocError());}
    });

  }
}
