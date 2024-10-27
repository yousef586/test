

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/new_tasks/cubit/states.dart';

class NewTasksCubit extends Cubit<NewTasksStates>{

  NewTasksCubit() : super(NewTasksInitialState());

  static NewTasksCubit gettask(context){
    return BlocProvider.of(context);
  }


void changebottemsheet(){
    emit(NewTasksInitialState());
}

}