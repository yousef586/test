

import 'package:flutter/material.dart';
import 'package:untitled1/shared/cubit/cubit.dart';

Widget defultButton({
  required VoidCallback function,
  required String text,
  Color color = Colors.blueAccent,
  double width = double.infinity,
}
    ){
  return Container(
    width: width,
    child: MaterialButton(
      onPressed: function,
      color: color,
      textColor: Colors.white,
      child: Text("$text)"),
    ),
  );
}

 Widget defultTextField({
  required TextEditingController controller,
   required TextInputType type,
   bool obscure=false,
   ValueChanged<String>? onSubmit,
   FormFieldValidator<String>? validate,
    IconData? preicon,
   IconData? posticon,
   void Function()? funicon,
   required String label,
   GestureTapCallback? tap,
 }){
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: obscure,
    onFieldSubmitted: onSubmit,
    validator: validate,
    onTap: tap ,
    decoration: InputDecoration(
        labelText: "$label",
        prefixIcon:  Icon(preicon),
        suffixIcon: IconButton( onPressed:funicon,
            icon:  Icon(posticon)),
        border: const OutlineInputBorder()
    ),
  );
}

Widget buildItems(Map model,context)=> Dismissible(
  key: Key(model["id"].toString()),
  onDismissed: (dircation ){
     AppCubit.getappobj(context).deletedatabase(id: model["id"]);
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blueAccent,
          child: Text("${model["time"]}",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${model["title"]}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
            Text("${model["date"]}",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey),),
          ],
        ),
        SizedBox(width:30),
      IconButton(
          onPressed: (){
        AppCubit.getappobj(context).updatedata(value:"done", id: model["id"]);
  }, icon: const Icon(
          Icons.check_box)),
        SizedBox(width: 5,),
        IconButton(
            onPressed: (){
              AppCubit.getappobj(context).updatedata(value:"archived", id: model["id"]);
            }, icon: const Icon(
            Icons.archive)),

      ],
    ),
  ),
);