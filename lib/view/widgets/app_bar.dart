
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {

  String? title;
  MyAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30
      ),
      child: Row(
        children: [
          InkWell(onTap:(){
            Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back_ios,size: 30,)),
          SizedBox(width: 20,),

          Text(title!,
            style: TextStyle(
                fontSize: height*0.025,
            ),)

        ],
      ),
    );
  }
}
