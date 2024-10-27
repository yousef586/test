
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DataModel{
  int? ID;
  String? Name;
  int? phonenumber;
  DataModel(this.ID, this.Name, this.phonenumber);
}

class UserScreen extends StatelessWidget {
  List<DataModel> data= [
    DataModel(1, "Yousef Ahmed", 01090676347),
    DataModel(1, "Yousef Ahmed", 01090676347),
    DataModel(1, "Yousef Ahmed", 01090676347),
    DataModel(1, "Yousef Ahmed", 01090676347),
    DataModel(1, "Yousef Ahmed", 01090676347),
    DataModel(1, "Yousef Ahmed", 01090676347),
    DataModel(1, "Yousef Ahmed", 01090676347),
    DataModel(1, "Yousef Ahmed", 01090676347),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        title: Container(alignment: Alignment.center,
            child: Text("Users",
              style: TextStyle(color: Colors.white,),
               ),
        ),
      ),
       body:ListView.separated(
           itemBuilder: (context,index){return BuildItem(data[index],index);
           },
           separatorBuilder: (context,index)=>Padding(
             padding: const EdgeInsetsDirectional.only(
               start: 25,
             ),
             child: Container(
               width: double.infinity,
               height: 1,
               color: Colors.grey[300],
             ),
           ),
           itemCount: data.length)
    );
  }
}

Widget BuildItem(DataModel data, index)=>Padding(
  padding: const EdgeInsets.all(25.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: CupertinoColors.activeBlue,
        child: Text("$index",style: TextStyle(color: Colors.white,fontSize: 35),),
      ),
      SizedBox(width: 20,),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${data.Name}", style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text("${data.phonenumber}",style: TextStyle(fontSize: 15),),
        ],
      ),
    ],
  ),
);


