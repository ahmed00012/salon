

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GoodJob extends StatelessWidget {
  const GoodJob({Key? key}) : super(key: key);

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
