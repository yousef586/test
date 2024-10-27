import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/BMIScreen.dart';
class Bmiresults extends StatelessWidget {
  const Bmiresults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Result=$result'),
            Text('Age=$age'),
            Text('Weight=$weight'),
          ],
        ),
      ),
    );
  }
}
