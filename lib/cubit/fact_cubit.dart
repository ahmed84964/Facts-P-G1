import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../Model/FactModel.dart';
import '../Remote/dio_helper.dart';

part 'fact_state.dart';

class FactCubit extends Cubit<FactState> {
  FactCubit() : super(FactInitial());

  static FactCubit get(context) => BlocProvider.of(context);

  FactModel? model;

  void getRandomFact() async {
    emit(FactLoading());
    try{
      final response=await DioHelper.getRandomFact();
      if(response.statusCode==200){
        model=FactModel.fromJson(response.data);
        emit(FactSuccess(model!));
      }else{
        emit(FactError("Failed to load fact","Status Code: ${response.statusCode}, Message: ${response.statusMessage}"));
      }
    }catch(e){
      emit(FactError("Can't fetch data", e.toString()));

    }
  }
}
