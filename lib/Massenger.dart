import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Massenger extends StatelessWidget {
  const Massenger({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
         title:Row(
           children: [
             CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage("https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg"),
                     ),
             SizedBox(width: 10,),
             Text("Chats",
               style: TextStyle(color: Colors.white),)
           ],
         ),

        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: Icon(Icons.camera_alt_rounded,
            size: 25,
            color: Colors.white,),
          ),),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: Icon(Icons.mode_edit_outline_rounded,
            size: 25,
            color: Colors.white,),
          )),
        ],
      ),
      
      body: Container(color: Colors.black,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[900]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:5,bottom: 5),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Icon(Icons.search,
                        color: Colors.grey[700],),
                        const SizedBox(width: 5,),
                        Text("Search",
                        style: TextStyle(color: Colors.grey[700]),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(height: 120,
                  child: ListView.separated(
                     scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>BuildItem(),
                      separatorBuilder: (context,index)=>SizedBox(width: 20,),
                      itemCount: 5),
                ),
                SizedBox(height: 20,),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>BuildItemII(),
                    separatorBuilder: (context,index)=>SizedBox(height: 10,),
                    itemCount: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget BuildItem()=>Row(
  children:[
    Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 18
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg"),
                radius: 35,
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 1,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 1,
                    bottom: 1
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 6,
                ),
              ),
            ],
          ),

        ),
        SizedBox(height: 10,),
        Container(
          width: 100,
          child: Text("Maryam Mohamed elsyaed abdalltef"
            ,style: TextStyle(color: Colors.white,
                fontSize: 10
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,),) ],
    ),
    SizedBox(width: 10,),
    Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 18
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg"),
                radius: 35,
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 1,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 1,
                    bottom: 1
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 6,
                ),
              ),
            ],
          ),

        ),
        SizedBox(height: 10,),
        Container(
          width: 100,
          child: Text("Maryam Mohamed elsyaed abdalltef"
            ,style: TextStyle(color: Colors.white,
                fontSize: 10
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,),) ],
    ),
    SizedBox(width: 10,),
    Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 18
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg"),
                radius: 35,
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 1,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 1,
                    bottom: 1
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 6,
                ),
              ),
            ],
          ),

        ),
        SizedBox(height: 10,),
        Container(
          width: 100,
          child: Text("Maryam Mohamed elsyaed abdalltef"
            ,style: TextStyle(color: Colors.white,
                fontSize: 10
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,),) ],
    ),
    SizedBox(width: 10,),
    Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 18
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://www.perfocal.com/blog/content/images/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg"),
                radius: 35,
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 1,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 1,
                    bottom: 1
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 6,
                ),
              ),
            ],
          ),

        ),
        SizedBox(height: 10,),
        Container(
          width: 100,
          child: Text("Maryam Mohamed elsyaed abdalltef"
            ,style: TextStyle(color: Colors.white,
                fontSize: 10
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,),) ],
    ),

  ],
);

Widget BuildItemII()=>Row(
  children: [
    Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
      ),
    ),
    SizedBox(width: 10,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amr Ahmed",style: TextStyle(color: Colors.white)),
        // SizedBox(height: 1,),
        Text("Ezayk 3aml eh - 11:55 PM",style: TextStyle(fontSize: 10,color: Colors.white),),
      ],
    ),

  ],
);