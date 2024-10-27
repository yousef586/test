import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/newsapp/cubit/states.dart';
import 'package:untitled1/modules/buissnes_screen/buissnes_screen.dart';
import 'package:untitled1/modules/science_screen/science_screen.dart';
import 'package:untitled1/modules/sports_screen/sports_screen.dart';

import '../../../modules/settings_screen/settings_screen.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{
  NewsAppCubit() : super(NewsInitialState());

  static NewsAppCubit getNewsAppCubit(context){
    return BlocProvider.of(context);
  }

  List <String> appbartitle = [
    "Sports News",
    "Business News",
  ];

  List<Widget> screens= const[
     SportsScreen(),
    BuissnesScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  int currentidex=0;

 void changeindex({
  required int index
 }){
   currentidex = index;
   emit(NewsBottomNaveState());
 }

 List<BottomNavigationBarItem> bottomitems = [
   BottomNavigationBarItem(
       icon: Icon(Icons.sports,),
       label: "Sports"),
   BottomNavigationBarItem(
       icon: Icon(Icons.business,),
       label: "Business"),
   BottomNavigationBarItem(
       icon: Icon(Icons.science,),
       label: "Science"),
   BottomNavigationBarItem(
       icon: Icon(Icons.settings,),
       label: "Settings"),

 ] ;

}