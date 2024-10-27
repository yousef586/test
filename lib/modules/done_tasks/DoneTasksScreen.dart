import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, AppStates state) {
      },
      builder: (BuildContext context, AppStates state) {
        var Donetasks=AppCubit.getappobj(context).DoneTasks;
        print(Donetasks);

        return ListView.separated(
            itemBuilder: (context,index)=>buildItems(Donetasks[index],context),
            separatorBuilder: (context,index)=>Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Container(
                color: Colors.grey[300],
                width: double.infinity,
                height: 1,
              ),
            ),
            itemCount: Donetasks.length); },
    );
  }
}
