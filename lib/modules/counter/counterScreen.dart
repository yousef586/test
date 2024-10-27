import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/counter/cuibt/cubit.dart';
import 'package:untitled1/modules/counter/cuibt/states.dart';

class counterScreen extends StatefulWidget {
  const counterScreen({super.key});

  @override
  State<counterScreen> createState() => _counterScreenState();
}

class _counterScreenState extends State<counterScreen> {
  int conuter=0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.getobject(context).minus();
                    },
                    child: Text(
                      "Minus",style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text("${CounterCubit.getobject(context).counter}",style: TextStyle(fontSize: 50),),
                  SizedBox(width: 20,),
                  TextButton(
                    onPressed: () {
                      CounterCubit.getobject(context).plus();
                    },
                    child: Text(
                      "Plus",style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
