

import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
   SideMenuItem({Key? key,this.title,this.icon}) : super(key: key);
  String ?icon;
  String? title;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(icon!,height: height*0.07,),
            SizedBox(height: 20,),
            Text(title!,style: TextStyle(
                fontSize: height*0.025
            ),)


          ],
        ),

      ),
    );
  }
}
