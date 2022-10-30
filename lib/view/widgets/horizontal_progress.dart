
import 'package:flutter/material.dart';

import '../../constants.dart';

class HorizontalProgress extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.07,
      width: width,
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 25,
                width: width*0.5,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                height: 25,
                width: width*0.3,
                decoration: BoxDecoration(
                  color: Constants.mainColor2,
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ],
          ),
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('7/9 Done'),
          )
        ],
      ),
    );
  }
}
