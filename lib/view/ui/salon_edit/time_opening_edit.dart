
import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/edit_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/center_registration_provider1.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';
import 'documentations.dart';

class TimeOpeningEdit extends ConsumerWidget {
  const TimeOpeningEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(editInfoFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final localizations = MaterialLocalizations.of(context);
    return Scaffold(
      body: Column(
          children: [
            MyAppBar(title: 'Working Info',),

            Expanded(child: StatefulBuilder(

                builder: (context,setState){


                  return ListView(

                    children: [

                      Center(child: Text('Pick Your Opening Times',style: TextStyle(
                        fontSize: height*0.02,
                        fontWeight: FontWeight.bold
                      ),)),
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Column(
                            children: [
                              Text('From',style: TextStyle(fontSize: height*0.018),),
                              SizedBox(height: 5,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    helpText: 'Available From',
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {

                                    if(value!=null)
                                      controller.setOpenAndCloseHours(value, true);
                                  });
                                },
                                child: Container(
                                  height: height*0.065,
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Center(
                                    child: Text(
                                        localizations.formatTimeOfDay(controller.open),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 50,),
                          Column(
                            children: [
                              Text('To',style: TextStyle(fontSize: height*0.018),),
                              SizedBox(height: 5,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    helpText: 'Available To',
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    // controller.setEmployee(0,timeTo: value);
                                    if(value!=null)
                                    controller.setOpenAndCloseHours(value, false);

                                  });
                                },
                                child: Container(
                                  height: height*0.065,
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Center(
                                    child: Text(
                                        localizations.formatTimeOfDay(controller.close)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Divider(),
                      SizedBox(height: 10,),
                      Center(
                        child: Text('Holidays',
                          style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: controller.holidays.contains('Saturday'),
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value){
                                controller.chooseHolidays('Saturday');

                              }),
                          InkWell(
                              onTap: (){
                                controller.chooseHolidays('Saturday');
                              },
                              child: Text('Sat',style: TextStyle(fontSize: height*0.02),)),
                          SizedBox(width: 10,),

                          Checkbox(
                              value: controller.holidays.contains('Sunday'),
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value){
                                controller.chooseHolidays('Sunday');

                              }),
                          InkWell(
                              onTap: (){
                                controller.chooseHolidays('Sunday');
                              },
                              child: Text('Sun',style: TextStyle(fontSize: height*0.02),)),
                          SizedBox(width: 10,),

                          Checkbox(
                              value: controller.holidays.contains('Monday'),
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value){
                                controller.chooseHolidays('Monday');

                              }),
                          InkWell(
                              onTap: (){
                                controller.chooseHolidays('Monday');
                              },
                              child: Text('Mon',style: TextStyle(fontSize: height*0.02),)),

                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Checkbox(
                              value: controller.holidays.contains('Tuesday'),
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value){
                                controller.chooseHolidays('Tuesday');

                              }),
                          InkWell(
                              onTap: (){
                                controller.chooseHolidays('Tuesday');
                              },
                              child: Text('Tue',style: TextStyle(fontSize: height*0.02),)),
                          SizedBox(width: 10,),
                          Checkbox(
                              value: controller.holidays.contains('Wednesday'),
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value){
                                controller.chooseHolidays('Wednesday');

                              }),
                          InkWell(
                              onTap: (){
                                controller.chooseHolidays('Wednesday');
                              },
                              child: Text('Wed',style: TextStyle(fontSize: height*0.02),)),
                          SizedBox(width: 10,),

                          Checkbox(
                              value: controller.holidays.contains('Thursday'),
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value){
                                controller.chooseHolidays('Thursday');

                              }),
                          InkWell(
                              onTap: (){
                                controller.chooseHolidays('Thursday');
                              },
                              child: Text('Thu',style: TextStyle(fontSize: height*0.02),)),
                          SizedBox(width: 10,),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: controller.holidays.contains('Friday'),
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value){
                                controller.chooseHolidays('Friday');

                              }),
                          InkWell(
                              onTap: (){
                                controller.chooseHolidays('Friday');
                              },
                              child: Text('Fri',style: TextStyle(fontSize: height*0.02),)),

                        ],
                      ),

                      SizedBox(height: 50,),



                       Padding(
                         padding:  EdgeInsets.symmetric(horizontal: width*0.2),
                         child: InkWell(
                          onTap: (){
                            controller.updateProviderInfo(context);
                          },
                          child: Container(
                            height: height*0.06,
                            width: width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Constants.mainColor2
                            ),
                            child: Center(
                              child: Text('Done',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                      ),
                       ),
                      SizedBox(height: 50,),

                    ],
                  );
                }),

           )

          ],
        ),

    );
  }
}
