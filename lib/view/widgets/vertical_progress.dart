

import 'package:flutter/material.dart';

import '../../constants.dart';

class VerticalProgress extends StatelessWidget {

  double ?height;
  double ?progressHeight;
  int? index;
  VerticalProgress({this.height,this.progressHeight,this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ListView.builder(
                itemCount: index,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,i){
                  return  Column(
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
                          (index!-1)==i?
                          Text(
                            index.toString(),
                            style: TextStyle(color: Colors.white),
                          ):Icon(Icons.check,color: Colors.white,),
                        ),
                      ),
                      if((index!-1)!=i)
                        Container(
                          width: 2,
                          height:20,

                          color: Constants.mainColor2,
                        )
                    ],
                  );
                }),



            Expanded(

              child: Container(
                width: 5,
                child: Column(
                  children: [
                    Container(
                      height: progressHeight!,
                      width: 2,
                      color: Constants.mainColor2,
                    ),
                    Expanded(
                      child: Container(
                       
                        width: 1,
                        color: Colors.black38,
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
