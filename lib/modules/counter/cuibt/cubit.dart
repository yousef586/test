


import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/counter/cuibt/states.dart';

class CounterCubit extends Cubit<CounterStates>{

   CounterCubit() : super(CounterInitialState());

  static CounterCubit getobject(context){
      return BlocProvider.of(context);
   }

   int counter=1;

  void minus (){
    if(counter>0){
    counter--;
    emit(CounterMinusState());}

  }


   void plus (){
     counter++;
     emit(CounterPlusState());

   }

}