

import 'package:flutter/material.dart';

import '../../constants.dart';

class VerticalProgress extends StatelessWidget {

  double ?height;
  double ?progressHeight;
  int? index;
  VerticalProgress({this.height,this.progressHeight,this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Constants.mainColor2,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child:
                  index==1?
                  Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ):Icon(Icons.check,color: Colors.white,),
                ),
              ),
              if(index==2)

                Column(
                  children: [
                    Container(
                      height: 10,
                      width: 2,
                      color:Constants.mainColor2,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Constants.mainColor2,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: index==2?
                        Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ):Icon(Icons.check,color: Colors.white,),
                      ),
                    ),
                  ],
                ),



              Expanded(
                child: Container(
                  width: 5,
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        width: 1,

                        color: Colors.black38,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Container(
                          height: progressHeight!,
                          width: 3,

                          color: Constants.mainColor2,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
