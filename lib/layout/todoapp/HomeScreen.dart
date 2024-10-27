import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/modules/new_tasks/cubit/cubit.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/components/constensts.dart';
import 'package:untitled1/modules/archived_tasks/ArchivedTasksScreen.dart';
import 'package:untitled1/modules/done_tasks/DoneTasksScreen.dart';
import 'package:untitled1/modules/new_tasks/NewTasksScreen.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {


   HomeScreen({super.key});

   TextEditingController titleEditingController=TextEditingController();
   TextEditingController dateEditingController=TextEditingController();
   TextEditingController timeEditingController=TextEditingController();
   var scafoldKey=GlobalKey<ScaffoldState>();
   var formKey=GlobalKey<FormState>();
   @override
   Widget build(BuildContext context) {
     return BlocProvider(
       create: (BuildContext context) =>AppCubit()..createDatabase(),
       child: BlocConsumer<AppCubit,AppStates>(
         listener: (context, state){
         if(state is InsertDatabase){
           Navigator.pop(context);
           }
         },
         builder: (BuildContext context, state){
            AppCubit app=AppCubit.getappobj(context);
           return Scaffold(
             key: scafoldKey,
             appBar: AppBar(
               elevation: 100,
               title: Container(alignment:Alignment.center,
                   child: Text(app.Title[app.currentstate])),),
             bottomNavigationBar:  BottomNavigationBar(
               items: const [BottomNavigationBarItem(
                   icon: Icon(Icons.menu),
                   label: "Tasks" ),
                 BottomNavigationBarItem(
                   icon: Icon(Icons.done),
                   label: "Done",),
                 BottomNavigationBarItem(icon: Icon(Icons.archive),
                     label: "Archived")],
               currentIndex: app.currentstate,
               onTap: (index){
                 app.changestate(index);
               },
             ),
             floatingActionButton: FloatingActionButton(
               onPressed: (){
                 if(app.bottemsheet==false){
                   scafoldKey.currentState?.showBottomSheet((context){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Form(
                         key: formKey,
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             defultTextField(controller: titleEditingController,
                                 type: TextInputType.text,
                                 label: "Title",
                                 validate: (value){
                                   if(value!.isEmpty){
                                     return "Title is Required";
                                   };
                                 },
                                 preicon: Icons.title),
                             SizedBox(height: 10,),
                             defultTextField(controller: dateEditingController,
                               type: TextInputType.datetime,
                               label: "Date",
                               preicon: Icons.date_range,
                               validate: (value){
                                 if(value!.isEmpty){
                                   return "Date is Required";
                                 };
                               },
                               tap: ()async{
                                 showDatePicker(context: context,
                                     firstDate: DateTime.now(),
                                     lastDate: DateTime.parse("2024-11-24")).then((value){
                                   print(value);
                                   dateEditingController.text=DateFormat.yMMMd().format(value!);

                                 });
                               },
                             ),
                             SizedBox(height: 10,),
                             defultTextField(controller: timeEditingController,
                                 type: TextInputType.datetime,
                                 label: "Time",
                                 preicon: Icons.watch_later_outlined,
                                 validate: (value){
                                   if(value!.isEmpty){
                                     return "Time is required";
                                   }
                                 },

                                 tap: (){
                                   showTimePicker(context: context, initialTime: TimeOfDay.now()
                                   ).then((value){
                                     timeEditingController.text=value!.format(context).toString();
                                   });
                                 }
                             ),
                           ],
                         ),
                       ),
                     );
                   }).closed.then((value){
                     // setState(() {bottemsheet=false;});
                     app.changebottomsheet(false);
                   });

                   // setState(() {
                   //   bottemsheet=true;
                   // });
                   app.changebottomsheet(true);

                 }
                 else if(app.bottemsheet==true && formKey.currentState!.validate()){
                   app.insertdb(
                       title: "${titleEditingController.text}",
                       date: "${dateEditingController.text}",
                       time: "${timeEditingController.text}").then((value){
                   });
                 }


               },
               child: app.bottemsheet?  Icon(Icons.add) : Icon(Icons.edit),
             ),
             body: state is !GetDatabaseLoadingState? app.list[app.currentstate] : Center(child: CircularProgressIndicator())

           );
         },
       ),
     );
   }

}




