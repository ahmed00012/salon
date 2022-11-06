

import 'package:beauty_center/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../../provider/center_registration_provider.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';

class TimeOpeningInfo extends ConsumerWidget {
  const TimeOpeningInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    helpText: 'Opening Time',
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    print(value);
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      helpText: 'Close Time',
                                      builder: (BuildContext context, child) {
                                        return MyTimePickerTheme(child: child,);
                                      },
                                    ).then((value) {
                                      print(value);
                                    });
                                  });


                                },
                                child: Container(
                                  height: height*0.08,

                                  
                                  decoration: BoxDecoration(
                                    color: Constants.mainColor2.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Constants.mainColor2)
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(value: true,
                                          activeColor: Constants.mainColor2,
                                          onChanged: (value){

                                          }),
                                      Text('Sat',style: TextStyle(
                                       fontSize: 16
                                      ),),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('From 09:00 AM',style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          SizedBox(height: 5,),
                                          Text('To    09:00 PM',style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    helpText: 'Opening Time',
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    print(value);
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      helpText: 'Close Time',
                                      builder: (BuildContext context, child) {
                                        return MyTimePickerTheme(child: child,);
                                      },
                                    ).then((value) {
                                      print(value);
                                    });
                                  });


                                },
                                child: Container(
                                  height: height*0.08,


                                  decoration: BoxDecoration(
                                      color: Constants.mainColor2.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Constants.mainColor2)
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(value: true,
                                          activeColor: Constants.mainColor2,
                                          onChanged: (value){

                                          }),
                                      Text('Sun',style: TextStyle(
                                          fontSize: 16
                                      ),),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('From 09:00 AM',style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          SizedBox(height: 5,),
                                          Text('To    09:00 PM',style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    print(value);
                                  });
                                },
                                child: Container(
                                  height: height*0.08,


                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(value: false,
                                          activeColor: Constants.mainColor2,
                                          onChanged: (value){

                                          }),
                                      Text('Mon',style: TextStyle(
                                          fontSize: 16
                                      ),),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('From 09:00 AM',style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          SizedBox(height: 5,),
                                          Text('To    09:00 PM',style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    print(value);
                                  });
                                },
                                child: Container(
                                  height: height*0.08,


                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(value: false,
                                          activeColor: Constants.mainColor2,
                                          onChanged: (value){

                                          }),
                                      Text('Tue',style: TextStyle(
                                          fontSize: 16
                                      ),),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('From 09:00 AM',style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          SizedBox(height: 5,),
                                          Text('To    09:00 PM',style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    print(value);
                                  });
                                },
                                child: Container(
                                  height: height*0.08,


                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(value: false,
                                          activeColor: Constants.mainColor2,
                                          onChanged: (value){

                                          }),
                                      Text('Wed',style: TextStyle(
                                          fontSize: 16
                                      ),),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('From 09:00 AM',style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          SizedBox(height: 5,),
                                          Text('To    09:00 PM',style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    print(value);
                                  });
                                },
                                child: Container(
                                  height: height*0.08,


                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(value: false,
                                          activeColor: Constants.mainColor2,
                                          onChanged: (value){

                                          }),
                                      Text('Thu',style: TextStyle(
                                          fontSize: 16
                                      ),),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('From 09:00 AM',style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          SizedBox(height: 5,),
                                          Text('To    09:00 PM',style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (BuildContext context, child) {
                                      return MyTimePickerTheme(child: child,);
                                    },
                                  ).then((value) {
                                    print(value);
                                  });
                                },
                                child: Container(
                                  height: height*0.08,


                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(value: false,
                                          activeColor: Constants.mainColor2,
                                          onChanged: (value){

                                          }),
                                      Text('Fri',style: TextStyle(
                                          fontSize: 16
                                      ),),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('From 09:00 AM',style: TextStyle(
                                              fontSize: 12
                                          ),),
                                          SizedBox(height: 5,),
                                          Text('To    09:00 PM',style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
                                ),
                              ),



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
