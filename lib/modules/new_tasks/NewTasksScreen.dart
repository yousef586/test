import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/new_tasks/cubit/cubit.dart';
import 'package:untitled1/shared/components/constensts.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

import '../../shared/components/components.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, AppStates state) {
      },
      builder: (BuildContext context, AppStates state) {
        var Newtasks=AppCubit.getappobj(context).NewTasks;
        print(Newtasks);

        return ListView.separated(
          itemBuilder: (context,index)=>buildItems(Newtasks[index],context),
          separatorBuilder: (context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 1,
            ),
          ),
          itemCount: Newtasks.length); },
    );
  }
}
