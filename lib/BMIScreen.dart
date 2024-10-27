import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/BMIResults.dart';

class Bmiscreen extends StatefulWidget {
  const Bmiscreen({super.key});

  @override
  State<Bmiscreen> createState() => _BmiscreenState();
}
double result=0;
bool? isMale=false;
double height=120;
int age=20;
int weight=80;
class _BmiscreenState extends State<Bmiscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(alignment: Alignment.center
            ,child: const Text("BMI CALCULATOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)
              ,)
        ),

      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color:Colors.black,
                  child:  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 20
                        ),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=true;
                            });
                          },
                          child: Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                              color: isMale!?  Colors.blueAccent : Colors.grey[800] ,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                    image: AssetImage("assets/images/male.png"),
                                  height: 120,
                                  width: 140,

                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    bottom: 29
                                  ),
                                  child: Text("MALE",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Padding(
                          padding:EdgeInsetsDirectional.only(
                            start: 20),
                          child: Container(

                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                              color: isMale!?  Colors.grey[800] : Colors.blueAccent ,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Image(
                            image: AssetImage("assets/images/female.png"),
                            height: 90,
                            width: 90,
                          ),
                                Text("FEMALE",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HEIGHT",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),

                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("${height.round()}",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text("CM",style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Slider(
                            value: height,
                            max: 220,
                            min:80,
                            activeColor:Colors.blueAccent,
                            onChanged: (value){
                              setState(() {
                                height=value;
                              });
                            },
                        )

                      ],

                    ),
                    // width: 380,
                    // height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[800],
                    ),
                  ),
                )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.grey[800],),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("AGE",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              Text("$age",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: (

                                      ){
                                    setState(() {
                                      age++;
                                    });

                                  },
                                    child: Icon(Icons.add),
                                    mini: true,
                                  ),
                                  FloatingActionButton(onPressed: (){
                                    setState(() {
                                      if(age>0){
                                      age--;}
                                    });
                                  },
                                      child: Icon(Icons.remove),
                                  mini: true,),
                                ]
                              )

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[800],),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("WIEGHT",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              Text("$weight",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(onPressed: (){
                                      setState(() {

                                          weight++;
                                      });
                                    },
                                      child: Icon(Icons.add),
                                      mini: true,
                                    ),
                                    FloatingActionButton(onPressed: (){
                                      setState(() {
                                        if(weight>30){
                                          weight--;}
                                      });
                                    },
                                      child: Icon(Icons.remove),
                                      mini: true,),
                                  ]
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                   ),
                ),
            ),
            Container(
                width: double.infinity,
                height: 60,
                child: MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bmiresults()));
                  result=weight/pow(height/100, 2);
                },color: Colors.redAccent,
                  child: const Text("CALCULATE",style: TextStyle(color: Colors.white),),
                ),
            ),
          ],
        ),
      ) ,
    );
  }
}
