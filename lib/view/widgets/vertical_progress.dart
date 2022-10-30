

import 'package:flutter/material.dart';

import '../../constants.dart';

class VerticalProgress extends StatelessWidget {

  double ?height;
  double ?progressHeight;
  VerticalProgress({this.height,this.progressHeight});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(),
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
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
      ),
    );
  }
}
