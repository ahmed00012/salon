

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/bottom_nav.dart';

class GoodJob extends StatefulWidget {
  const GoodJob({Key? key}) : super(key: key);

  @override
  State<GoodJob> createState() => _GoodJobState();
}

class _GoodJobState extends State<GoodJob> {

  @override
  void initState() {
   Future.delayed(Duration(seconds: 3),(){
     Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavBar()));
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text('Good Job You Have Compeleted Registeration',
             textAlign:TextAlign.center,style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.03
          ),),
          Lottie.asset('assets/images/lf30_editor_emz6fqby.json')
        ],
      ),
    );
  }
}
