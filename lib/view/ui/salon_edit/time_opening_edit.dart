
import 'package:beauty_center/constants.dart';
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
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final localizations = MaterialLocalizations.of(context);
    return Scaffold(
      body: Column(
          children: [
            MyAppBar(title: 'Working Info',),
            HorizontalProgress(index: 2,),
            SizedBox(height: 20,),
            Expanded(child: StatefulBuilder(

                builder: (context,setState){


                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child:  ListView(

                            children: [
                              Center(child: Text('Add Salon Logo',style: TextStyle(
                                  fontSize: height*0.02,
                                  fontWeight: FontWeight.bold
                              ),)),
                              SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  showDialog(context: context,
                                      builder:(context){
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.pop(context);
                                              controller.pickImage(false);
                                            },
                                            child: Container(
                                              height: height*0.05,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.add),
                                                    SizedBox(width: 5,),
                                                    Text('Pick Photo'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          InkWell(
                                            onTap: (){
                                              Navigator.pop(context);
                                              showDialog(context: context,
                                                  builder: (context){
                                                return AlertDialog(
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        height: height*0.3,
                                                        width: width,
                                                        child: GridView.builder(
                                                            itemCount: 4,
                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount: 2,
                                                                childAspectRatio: 1.2
                                                            ),
                                                            itemBuilder: (context,i){
                                                              return  Padding(
                                                                padding: const EdgeInsets.all(10.0),
                                                                child: InkWell(
                                                                  onTap: (){
                                                                    controller.pickImage(true,index:i );
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    height: height*0.1,
                                                                    width: height*0.1,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(width: 2),
                                                                        shape: BoxShape.circle
                                                                    ),
                                                                    child: Center(
                                                                      child: Image.asset(controller.recommendedPics[i],
                                                                      height: height*0.07,),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                    ],
                                                  ),
                                                );
                                                  });
                                            },
                                            child: Container(
                                              height: height*0.05,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.image),
                                                    SizedBox(width: 5,),
                                                    Text('Recommended'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    );
                                  }
                                  );
                                },
                                child: Container(
                                      height: height*0.15,
                                      width: height*0.15,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(color: Constants.mainColor2,width: 2)
                                      ),
                                      child: Center(
                                        child:
                                        controller.pickedSalonLogo!=null?
                                            Image.asset(controller.pickedSalonLogo!,height: height*0.1,):
                                        controller.salonImage!=null?
                                        ClipOval(
                                            child: Image.file(controller.salonImage!,
                                            height: height*0.145,
                                            width: height*0.145,
                                              fit: BoxFit.cover,
                                            )):
                                        Icon(Icons.add_a_photo,color: Colors.black38,size: 60,),
                                      ),
                                    ),
                              ),


                              SizedBox(height: 30,),
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
                                                controller.open!=null?
                                                localizations.formatTimeOfDay(controller.open!):
                                                ' 09:00 AM'
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
                                                controller.open!=null?
                                                localizations.formatTimeOfDay(controller.open!):
                                                ' 09:00 PM'
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
                                      value: controller.holidays.contains('Sat'),
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value){
                                        controller.chooseHolidays('Sat');

                                      }),
                                  InkWell(
                                      onTap: (){
                                        controller.chooseHolidays('Sat');
                                      },
                                      child: Text('Sat',style: TextStyle(fontSize: height*0.02),)),
                                  SizedBox(width: 10,),

                                  Checkbox(
                                      value: controller.holidays.contains('Sun'),
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value){
                                        controller.chooseHolidays('Sun');

                                      }),
                                  InkWell(
                                      onTap: (){
                                        controller.chooseHolidays('Sun');
                                      },
                                      child: Text('Sun',style: TextStyle(fontSize: height*0.02),)),
                                  SizedBox(width: 10,),

                                  Checkbox(
                                      value: controller.holidays.contains('Mon'),
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value){
                                        controller.chooseHolidays('Mon');

                                      }),
                                  InkWell(
                                      onTap: (){
                                        controller.chooseHolidays('Mon');
                                      },
                                      child: Text('Mon',style: TextStyle(fontSize: height*0.02),)),

                                ],
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                      value: controller.holidays.contains('Tue'),
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value){
                                        controller.chooseHolidays('Tue');

                                      }),
                                  InkWell(
                                      onTap: (){
                                        controller.chooseHolidays('Tue');
                                      },
                                      child: Text('Tue',style: TextStyle(fontSize: height*0.02),)),
                                  SizedBox(width: 10,),
                                  Checkbox(
                                      value: controller.holidays.contains('Wed'),
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value){
                                        controller.chooseHolidays('Wed');

                                      }),
                                  InkWell(
                                      onTap: (){
                                        controller.chooseHolidays('Wed');
                                      },
                                      child: Text('Wed',style: TextStyle(fontSize: height*0.02),)),
                                  SizedBox(width: 10,),

                                  Checkbox(
                                      value: controller.holidays.contains('Thu'),
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value){
                                        controller.chooseHolidays('Thu');

                                      }),
                                  InkWell(
                                      onTap: (){
                                        controller.chooseHolidays('Thu');
                                      },
                                      child: Text('Thu',style: TextStyle(fontSize: height*0.02),)),
                                  SizedBox(width: 10,),

                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                      value: controller.holidays.contains('Fri'),
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value){
                                        controller.chooseHolidays('Fri');

                                      }),
                                  InkWell(
                                      onTap: (){
                                        controller.chooseHolidays('Fri');
                                      },
                                      child: Text('Fri',style: TextStyle(fontSize: height*0.02),)),

                                ],
                              ),

                              SizedBox(height: 50,),


                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>EditDocumentations()));
                                    },
                                    child: Container(
                                      height: height*0.06,
                                      width: width*0.25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Constants.mainColor2
                                      ),
                                      child: Center(
                                        child: Text('NEXT',style: TextStyle(color: Colors.white),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 50,),

                            ],
                          ),
                        ),
                      ),
                      VerticalProgress(height: height,progressHeight: height/2,index: 2,),
                    ],
                  );
                }),

           )

          ],
        ),

    );
  }
}
