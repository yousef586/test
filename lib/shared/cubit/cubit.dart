import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/shared/cubit/states.dart';

import '../../modules/archived_tasks/ArchivedTasksScreen.dart';
import '../../modules/done_tasks/DoneTasksScreen.dart';
import '../../modules/new_tasks/NewTasksScreen.dart';

class AppCubit extends Cubit<AppStates> {

    AppCubit() : super(AppInitialState());

    static AppCubit getappobj(context) {
        return BlocProvider.of(context);
    }

    Database? database;
    List<Map> NewTasks = [];
    List<Map> DoneTasks = [];
    List<Map> ArchivedTasks = [];

    List<Map> data = [];
    bool bottemsheet = false;
    int currentstate = 0;
    List<String> Title = [
        "New Tasks",
        "Done Tasks",
        "Archived Tasks"
    ];
    List<Widget> list = [
        NewTasksScreen(),
        DoneTasksScreen(),
        ArchivedTasksScreen(),

    ];

    void changestate(index) {
        currentstate = index;
        emit(AppNavegationBar());
    }

    void createDatabase() async {
        database = await openDatabase(
            "todo.db",
            version: 1,
            onCreate: (database, versions) {
                database.execute(
                    "CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT )"
                ).then((value) {
                    print("DATABASE CREATED SUCCESSFUL");
                }).catchError((error) {
                    print("$error");
                });
            },
            onOpen: (database) {
                getdata(database);
                emit(GetDatabase());
                print("DATABASE OPEND");
            }
        );
    }

    insertdb({
        @required String? title,
        @required String? date,
        @required String? time,
    }) async {
        await database?.transaction((txn) async {
            await txn.rawInsert(
                'INSERT INTO tasks ( title, date, time, status) VALUES("$title", "$date", "$time", "new" ) ');
        }).then((value) {
            emit(InsertDatabase());
            getdata(database);
                emit(GetDatabase());
            print("added");
        }).catchError((error) {
            print(error);
        });
    }


   Future<void> getdata(database) async {
      NewTasks.clear();
      DoneTasks.clear();
      ArchivedTasks.clear();
     emit(GetDatabaseLoadingState());
     await database.rawQuery("SELECT * FROM tasks").then((value){
           print(value);
           data=value;
           for(int i=0; i<data.length;i++){
             //print(data[i]);
             if(data[i]["status"]=="done"){
               DoneTasks.add(data[i]);
               //print(DoneTasks);
             }
             else if(data[i]["status"]=="new"){
               NewTasks.add(data[i]);
              // print(NewTasks);

             }
             else if(data[i]["status"]=="archived"){
               ArchivedTasks.add(data[i]);
               //  print(DoneTasks);

             }
           }
           emit(GetDatabase());
         });

    }

    void changebottomsheet(value) {
        bottemsheet = value;
        emit(ChangeBottomSheet());
    }

    Future updatedata({
        required value,
        required id
    }) async {
        await database?.rawUpdate(
            'UPDATE tasks SET status = ? WHERE id = ?',
            ['$value', id]).then((onValue) {
            print(data);
            emit(UpdateDatabase());
            getdata(database);});
    }

    Future deletedatabase({
      required id
    }) async {
      await database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((onValue) {
        print(data);
        emit(UpdateDatabase());
        getdata(database);});
    }
}