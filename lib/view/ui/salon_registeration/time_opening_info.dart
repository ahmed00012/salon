

import 'package:beauty_center/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../../provider/center_registration_provider1.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';
import 'documentations.dart';

class TimeOpeningInfo extends ConsumerWidget {
  const TimeOpeningInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final localizations = MaterialLocalizations.of(context);
    return Scaffold(
      body: Column(
          children: [
            MyAppBar(title: 'Salon Information',),
            HorizontalProgress(),
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
                              Center(child: Text('Add Salon Logo')),
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
                              Center(child: Text('Pick Your Opening Times')),
                              SizedBox(height: 20,),

                              ListView.builder(
                                  itemCount: controller.days.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context,i){
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        onTap: (){
                                          controller.timePickerDialog(context, i);
                                        },
                                        child: Container(
                                          height: height*0.08,
                                          decoration: BoxDecoration(
                                              color:
                                              controller.days[i].choosed!?
                                              Constants.mainColor2.withOpacity(0.2):
                                              Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color:
                                              controller.days[i].choosed!?
                                              Constants.mainColor2:
                                              Colors.black38,)
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(value: controller.days[i].choosed,
                                                  activeColor: Constants.mainColor2,
                                                  onChanged: (value){
                                                    controller.timePickerDialog(context, i);
                                                    },

                                              ),
                                              Text(controller.days[i].day!,style: TextStyle(
                                                  fontSize: 16
                                              ),),
                                              Spacer(),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  if(controller.days[i].opening!=null)
                                                  Text('From '+localizations.formatTimeOfDay(controller.days[i].opening!),
                                                    style: TextStyle(fontSize: 12),),
                                                  SizedBox(height: 5,),

                                                  if(controller.days[i].closing!=null)
                                                  Text('To     '+localizations.formatTimeOfDay(controller.days[i].closing!),
                                                    style: TextStyle(fontSize: 12),)
                                                ],
                                              ),
                                              SizedBox(width: 10,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                              SizedBox(height: 50,),


                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>AddDocumentations()));
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
