

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/reservation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Reservations extends ConsumerWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final controller = ref.watch(reservationFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: ListView(
        children: [
          SizedBox(height: 10,),
          // Row(
          //   children: [
          //     SizedBox(width: 20,),
          //     Icon(Icons.arrow_back_ios,size: 30,),
          //     SizedBox(width: 10,),
          //     Text('Reports',style: TextStyle(
          //         fontSize: height*0.03,
          //         fontWeight: FontWeight.bold
          //     ),),
          //   ],
          // ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Reservations',
              style: TextStyle(
                  fontSize: height * 0.035, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 10,),

          ListView.builder(
              itemCount: controller.reservations.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,i){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height*0.22,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Constants.mainColor2)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: height*0.05,
                              width: height*0.05,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(controller.reservations[i].clientName!,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height*0.02
                            ),),
                            Spacer(),
                            Text(controller.reservations[i].totalPayment! + ' EGP',
                              style: TextStyle(color: Colors.black45),)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 50,),
                          Icon(Icons.confirmation_num ,color: Colors.black45,),
                          SizedBox(width: 10,),
                          Text('#'+controller.reservations[i].orderNumber.toString(),style: TextStyle(
                            color: Colors.black45,
                            fontSize: height*0.018
                          ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            SizedBox(width: 40,),
                            Icon(Icons.calendar_month_outlined ,color: Colors.black45,),
                            SizedBox(width: 10,),
                            Text(controller.reservations[i].createdAt.toString(),style: TextStyle(
                                color: Colors.black45,
                                fontSize: height*0.018
                            ),),
                            Spacer(),
                            Text('Services : ',style: TextStyle(

                                fontSize: height*0.018
                            ),),
                            SizedBox(width: 10,),
                            Text(controller.reservations[i].services!.length.toString(),style: TextStyle(
                                color: Colors.black45,
                                fontSize: height*0.018
                            ),),

                          ],
                        ),
                      ),
                      Spacer(),
                     Container(height: 1,
                     width: width,
                     color: Colors.black12,),
                      Row(
                        children: [
                           Expanded(
                             child: Container(
                              height: height*0.06,
                             
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10)
                                )
                              ),
                               child: Center(
                                 child: Text(
                                   'Reject',
                                   style: TextStyle(
                                       fontSize: height*0.02),
                                 ),
                               ),
                          ),

                           ),
                          Expanded(
                             child: Container(
                              height: height*0.06,

                              decoration: BoxDecoration(
                                color: Constants.mainColor2,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10)
                                  )
                              ),
                               child: Center(
                                 child: Text(
                                   'Accept',
                                   style: TextStyle(color: Colors.white,
                                   fontSize: height*0.02),
                                 ),
                               ),
                          ),
                           ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })


        ],
      ),

    );
  }
}
