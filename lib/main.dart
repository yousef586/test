import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/BMIScreen.dart';
import 'package:untitled1/layout/todoapp/HomeScreen.dart';
import 'package:untitled1/Massenger.dart';
import 'package:untitled1/UserScreen.dart';
import 'package:untitled1/shared/bloc_observer.dart';

import 'Login.dart';
import 'layout/newsapp/news_app.dart';
import 'modules/counter/counterScreen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(myapp());
}

 class myapp extends StatelessWidget
 {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
                titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
           // iconTheme: IconThemeData(color: Colors.orange),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange

          ),
        ),
      home: NewsApp(),
    );
  }

}

