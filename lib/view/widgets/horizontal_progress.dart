
import 'package:flutter/material.dart';

import '../../constants.dart';

class HorizontalProgress extends StatelessWidget {

  int index ;
HorizontalProgress({required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
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
              width: width*0.5*(index*0.1),
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
          child: Text('${index}/8 Done'),
        )
      ],
    );
  }
}
