import 'package:beauty_center/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../provider/points_provider.dart';
import '../widgets/default_button.dart';



class PointsScreen extends ConsumerWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final controller = ref.watch(pointsFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      //  backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    'Points',
                    style: TextStyle(
                      fontSize: height*0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Balance :',
                        style: TextStyle(
                            fontSize: width * .05,
                            color: Colors.black
                        ),
                      ),
                      Text(
                        " 20 EGP",
                        style: TextStyle(
                            fontSize: width * .05,
                            color: Colors.green
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: height * .25,
                        height: height * .25,
                        decoration: BoxDecoration(
                            color:  Constants.mainColor2.withOpacity(0.2),
                            // border color
                            shape: BoxShape.circle,
                            border:
                            Border.all(width: 2, color: Constants.mainColor2)),
                        child: Padding(
                          padding: EdgeInsets.all(height * .02),
                          // border width
                          child: Container(
                           
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Constants.mainColor2.withOpacity(0.25),
                                border: Border.all(
                                    width: 5, color: Constants.mainColor2)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20,),
                                  Text(
                                    '100',
                                    style: TextStyle(
                                        fontSize: width * .08,
                                        height: height * .0024,
                                        fontWeight: FontWeight.bold,
                                        color: Constants.mainColor2),
                                  ),
                                  Text(
                                    'Points',
                                    style: TextStyle(
                                        fontSize: width * .06,
                                        height: height * .001,
                                      color: Constants.mainColor2
                                      //   fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ), // inner content
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: DefaultButton(
                          textColor: Colors.white,
                          color: Constants.mainColor2,
                          title:  'Convert',
                          radius: width * .4,
                          height: height * .07,
                          width: width * .45,
                          function: () {

                          },
                          font: width * .048,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "the minimum amount to covert points is 200 point",
                    style: TextStyle(
                        fontSize: width * .039,
                        color:Colors.grey
                      //   fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    //  height: height * .3,
                    width: width,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    child: Column(
                      children: [
                        Container(
                          width: width * .93,
                          height: height * .07,
                          decoration: BoxDecoration(
                              color: Constants.mainColor2.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  width: width * .31,
                                  height: height * .08,
                                  decoration: BoxDecoration(
                                      color: Constants.mainColor2,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                     'See All ....',
                                      style: TextStyle(
                                          fontSize: width * .039,
                                          color:Colors.white
                                        //   fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  width: width * .31,
                                  height: height * .08,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      'Earned',
                                      style: TextStyle(
                                          fontSize: width * .039,
                                          color:Colors.grey
                                        //   fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  width: width * .31,
                                  height: height * .08,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                     'Converted',
                                      style: TextStyle(
                                          fontSize: width * .039,
                                          color:Colors.grey
                                        //   fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.points.points!.length,
                            itemBuilder: (ctx, i) {
                              return
                              controller.points.points![i].isConverted ==0?
                              InkWell(
                                onTap: (){


                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: height * .1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: height * .06,
                                        width: width * .012,
                                        decoration: BoxDecoration(
                                            color:Constants.mainColor2,
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: VerticalDivider(
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Order No. #"+controller.points.points![i].orderId.toString(),
                                                  style: TextStyle(
                                                      fontSize: width * .034,
                                                      height: height * .002,
                                                      color: Colors.black
                                                    //   fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.04,
                                                ),
                                                Container(
                                                  height: 2,
                                                  width: width * 0.25,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  "+ ${controller.points.points![i].points}",
                                                  style: TextStyle(
                                                      fontSize: width * .04,
                                                      height: height * .002,
                                                      color: Constants.mainColor2,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  "  Point",
                                                  style: TextStyle(
                                                      fontSize: width * .03,
                                                      height: height * .002,
                                                      color: Colors.grey
                                                    //   fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: height * 0.005,
                                            // ),
                                            // Text(
                                            //   state.points.points![i].createdAt.toString(),
                                            //   style: TextStyle( height: height * .002,
                                            //       fontSize: width * .03,
                                            //       color: Colors.grey
                                            //     //   fontWeight: FontWeight.bold
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ):

                              controller.points.points![i].isConverted ==1?
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: height * .1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: height * .06,
                                        width: width * .012,
                                        decoration: BoxDecoration(
                                            color:Constants.mainColor2,
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: VerticalDivider(
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Order No. #"+controller.points.points![i].orderId.toString(),
                                                  style: TextStyle(
                                                      height: height * .002,
                                                      fontSize: width * .034,
                                                      color: Colors.black
                                                    //   fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.04,
                                                ),
                                                Container(
                                                  height: 2,
                                                  width: width * 0.25,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  "+ ${controller.points.points![i].points}",
                                                  style: TextStyle(
                                                      height: height * .002,
                                                      fontSize: width * .04,
                                                      color: Constants.mainColor2,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  "  Point",
                                                  style: TextStyle(
                                                      height: height * .002,
                                                      fontSize: width * .03,
                                                      color: Colors.grey
                                                    //   fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: height * 0.004,
                                            // ),
                                            // Text(
                                            //   state.points.points![i].createdAt.toString(),
                                            //   style: TextStyle(
                                            //       height: height * .002,
                                            //       fontSize: width * .03,
                                            //       color: Colors.grey
                                            //     //   fontWeight: FontWeight.bold
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ):
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: height * .1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: height * .06,
                                        width: width * .012,
                                        decoration: BoxDecoration(
                                            color:Constants.mainColor2,
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: VerticalDivider(
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Order No. #"+controller.points.points![i].orderId.toString(),
                                                  style: TextStyle(
                                                      height: height * .002,
                                                      fontSize: width * .034,
                                                      color: Colors.black
                                                    //   fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.04,
                                                ),
                                                Container(
                                                  height: 2,
                                                  width: width * 0.25,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  "+ ${controller.points.points![i].points}",
                                                  style: TextStyle(
                                                      height: height * .002,
                                                      fontSize: width * .04,
                                                      color: Constants.mainColor2,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  "  Point",
                                                  style: TextStyle(
                                                      height: height * .002,
                                                      fontSize: width * .03,
                                                      color: Colors.grey
                                                    //   fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: height * 0.006,
                                            // ),
                                            // Text(
                                            //   state.points.points![i].createdAt.toString(),
                                            //   style: TextStyle(
                                            //       height: height * .002,
                                            //       fontSize: width * .03,
                                            //       color: Colors.grey
                                            //     //   fontWeight: FontWeight.bold
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.1,)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
