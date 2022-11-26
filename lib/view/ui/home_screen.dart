
import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(homeFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final localizations = MaterialLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Salon Magdy',
                style: TextStyle(
                    fontSize: height * 0.035, fontWeight: FontWeight.bold),
              ),
            ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             InkWell(
                 onTap: (){
                   controller.setDate(DateTime(controller.dateTime.year,controller.dateTime.month,controller.dateTime.day-1));
                 },
                 child: Icon(Icons.arrow_back_ios,size: 30,)),
             InkWell(
               onTap: (){
                 showDatePicker(context: context,
                   initialDate: DateTime.now(),
                   firstDate: DateTime(DateTime.now().year, 1, 1),
                   lastDate: DateTime(DateTime.now().year+5, 12, 31),
                   builder: (context, child) {
                     return Theme(
                       data: Theme.of(context).copyWith(
                         colorScheme: ColorScheme.light(
                           primary: Constants.mainColor2,
                         ),
                       ),
                       child: child!,
                     );
                   },
                 ).then((value) {
                   if(value!=null){
                     controller.setDate(value);
                   }
                 });
               },
               child: Text(controller.date,
                 style: TextStyle(
                     fontSize: height * 0.035, fontWeight: FontWeight.bold),
               ),
             ),
             InkWell(
                 onTap: (){
                   controller.setDate(DateTime(controller.dateTime.year,controller.dateTime.month,controller.dateTime.day-1));
                 },
                 child: Icon(Icons.arrow_forward_ios,size: 30,)),
           ],
         ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: height * controller.timeOpening.length * 0.06,
                width: width,
                child: Center(
                  child: ListView.builder(
                      itemCount: controller.employees.length+1,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Container(
                          width: width * 0.2,
                          child: ListView.builder(
                              itemCount: controller.timeOpening.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, j) {
                                return Container(
                                  width: width * 0.1,
                                  height: j==0?height * 0.1:height*0.05,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black12)),
                                  child: j == 0
                                      ? i==0? Center(child: Text('Time'),):
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.lightGreen,
                                                      width: 3),
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          controller
                                                              .employees[i-1]
                                                              .image!))),
                                            ),
                                            Text(controller.employees[i-1].name!),
                                          ],
                                        )
                                 : Center(
                                   child: i==0?
                                   Text(localizations.formatTimeOfDay(controller.timeOpening[j]),
                                   style: TextStyle(
                                     color:
                                     controller.timeOpening[j].hour==DateTime.now().hour?
                                     Constants.mainColor2:Colors.black
                                   ) ,):
                                   controller.employees[i-1].times![j].free!?
                                       InkWell(
                                         onTap: (){
                                           controller.makeReservation(context,i-1,j);

                                         },
                                           child: Container(color: Colors.white,)):
                                   Center(
                                     child: controller.employees[i-1].times![j].inSalon!?
                                         Image.asset('assets/images/seat.png',color: Constants.mainColor2,
                                         height: height*0.025,):
                                     !controller.employees[i-1].times![j].onBreak!?
                                     Icon(
                                       Icons.home,
                                       color: Colors.black26,
                                     ):
                                    Container(color: Colors.black12,)
                                   ),
                                 ),
                                );
                              }),
                        );
                      }),
                ),
              ),
            ),

            // Expanded(
            //   child:TimePlanner(
            //     // time will be start at this hour on table
            //     startHour: 6,
            //
            //     // time will be end at this hour on table
            //     endHour: 23,
            //     // each header is a column and a day
            //     headers: [
            //       TimePlannerTitle(
            //         date: "3/10/2021",
            //         title: "sunday",
            //       ),
            //       TimePlannerTitle(
            //         date: "3/11/2021",
            //         title: "monday",
            //       ),
            //       TimePlannerTitle(
            //         date: "3/12/2021",
            //         title: "tuesday",
            //       ),
            //     ],
            //     // List of task will be show on the time planner
            //     tasks: controller.tasks,
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Table(
            //     border: TableBorder.all(width: 0.2,color: Colors.black38),
            //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            //     children: controller.timeOpening.map((e){
            //       int index = controller.timeOpening.indexOf(e);
            //       return index==0?
            //       TableRow(children: [
            //         TableCell(child: Center(child: Text('Time'))),
            //         TableCell(
            //             child: Column(
            //               children: [
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Container(
            //                   height: 50,
            //                   width: 50,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       border: Border.all(color: Colors.yellow,width: 3),
            //                       image: DecorationImage(
            //                           fit: BoxFit.fill,
            //                           image: AssetImage(
            //                               'assets/images/sergio-de-paula-c_GmwfHBDzk-unsplash.jpg'))),
            //                 ),
            //                 Text('Ahmed'),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //               ],
            //             )),
            //         TableCell(
            //             child: Column(
            //               children: [
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Container(
            //                   height: 50,
            //                   width: 50,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       border: Border.all(color: Colors.red,width: 3),
            //                       image: DecorationImage(
            //                           fit: BoxFit.fill,
            //                           image: AssetImage(
            //                               'assets/images/vince-fleming-j3lf-Jn6deo-unsplash.jpg'))),
            //                 ),
            //                 Text('Osama'),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //               ],
            //             )),
            //         TableCell(
            //             child: Column(
            //               children: [
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Container(
            //                   height: 50,
            //                   width: 50,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       border: Border.all(color: Colors.green,width: 3),
            //                       image: DecorationImage(
            //                           fit: BoxFit.fill,
            //                           image: AssetImage(
            //                               'assets/images/jake-nackos-IF9TK5Uy-KI-unsplash.jpg'))),
            //                 ),
            //                 Text('Maha'),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //               ],
            //             )),
            //         TableCell(
            //             child: Column(
            //               children: [
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Container(
            //                   height: 50,
            //                   width: 50,
            //                   decoration: BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       border: Border.all(color: Constants.mainColor2,width: 3),
            //                       image: DecorationImage(
            //                           fit: BoxFit.fill,
            //                           image: AssetImage(
            //                               'assets/images/houcine-ncib-B4TjXnI0Y2c-unsplash(1).jpg'))),
            //                 ),
            //                 Text('Bassant'),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //               ],
            //             )),
            //       ]):
            //       TableRow(children: [
            //         TableCell(child: Center(child: Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 20),
            //           child: Text(localizations.formatTimeOfDay(controller.timeOpening[index-1])),
            //         ))),
            //         TableCell(child: Container(
            //           color:controller.checkTime(0,index-1)?Colors.red:Colors.white,
            //           child: Text(
            //                 ''
            //
            //           ),
            //         )),
            //         TableCell(child: Container()),
            //         TableCell(child: Container()),
            //         TableCell(child: Container()),
            //       ]);
            //     }).toList(),
            //   ),
            // ),
            SizedBox(
              height: height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
