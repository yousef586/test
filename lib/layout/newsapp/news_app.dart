import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/newsapp/cubit/cubit.dart';
import 'package:untitled1/layout/newsapp/cubit/states.dart';

class NewsApp extends StatelessWidget {
   const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsAppCubit(),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          var appcubit = NewsAppCubit.getNewsAppCubit(context);
          return   Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ],
              title: Center(child: Text("News App")),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: appcubit.currentidex ,
                onTap: (index){
                  appcubit.changeindex(index: index);
                },
                items: appcubit.bottomitems),
            body: appcubit.screens[appcubit.currentidex],
        );

          },
      ),
    );
  }
}
