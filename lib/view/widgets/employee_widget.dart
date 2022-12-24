


import 'package:beauty_center/view/widgets/time_picker_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../provider/employee_provider.dart';
import 'add_works_picture.dart';
import 'default_text_field.dart';

class EmployeeWidget extends ConsumerWidget {
   EmployeeWidget({Key? key,this.i}) : super(key: key);
  int ?i;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(employeeFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final localizations = MaterialLocalizations.of(context);
    return
      controller.employees.length<2?
      Column(

      children: [
        Text('Employee Photo',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: (){
              controller.pickEmployeePhoto(0);
            },
            child: Container(
              height: height*0.16,
              width: height*0.16,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Constants.mainColor2,width: 2)
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  controller.employees.isNotEmpty&&controller.employees[0].photo!=null?
                  ClipOval(
                      child: Image.file(controller.employees[0].photo!,
                        height: height*0.155,
                        width: height*0.155,
                        fit: BoxFit.fill,
                      )):
                  Icon(Icons.person,color: Colors.black38,size: 60,),

                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(Icons.add_a_photo,color: Colors.white,size: 15,),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 30,),
        Container(
          width: width*0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            cursorColor: Constants.mainColor2,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    width: 1, color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    width: 1, color: Constants.mainColor2),
              ),
              labelText: 'Employee Name',
              labelStyle: TextStyle(color:Constants.mainColor2,
                  fontWeight: FontWeight.bold,fontSize: 14),
              prefixIcon:Icon(Icons.person,
                  color: Constants.mainColor2),
            ),
            onChanged: (value){
              controller.setEmployeeName(0, value);
            },

            validator: (value){},
          ),
        ),
        SizedBox(height: 20,),
        Container(
          width: width*0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            cursorColor: Constants.mainColor2,
            keyboardType:TextInputType.number,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      width: 1, color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      width: 1, color: Constants.mainColor2),
                ),
                labelText: 'Employee Phone',
                labelStyle: TextStyle(color:Constants.mainColor2,
                    fontWeight: FontWeight.bold,fontSize: 14),
                prefixIcon:Icon(Icons.phone,
                    color: Constants.mainColor2),
            ),
            onChanged: (value){
              controller.setEmployeePhone(0, value);
            },

            validator: (value){},
          ),
        ),
        SizedBox(height: 15,),
        Divider(),
        SizedBox(height: 10,),
        Text('Working Time',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
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
                      controller.setEmployeeTime(0,true,value!);

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
                          localizations.formatTimeOfDay(controller.employees[0].availableFrom!)
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
                      controller.setEmployeeTime(0,false,value!);

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
                          localizations.formatTimeOfDay(controller.employees[0].availableTo!)
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
        Text('Holidays',
          style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
                value: controller.employees[0].holidays!.contains('Sat'),
                activeColor:
                Constants.mainColor2,
                onChanged: (value){
                  controller.chooseHolidays(0,'Sat');

                }),
            InkWell(
                onTap: (){
                  controller.chooseHolidays(0,'Sat');
                },
                child: Text('Sat',style: TextStyle(fontSize: height*0.02),)),
            SizedBox(width: 10,),

            Checkbox(
                value: controller.employees[0].holidays!.contains('Sun'),
                activeColor:
                Constants.mainColor2,
                onChanged: (value){
                  controller.chooseHolidays(0,'Sun');

                }),
            InkWell(
                onTap: (){
                  controller.chooseHolidays(0,'Sun');
                },
                child: Text('Sun',style: TextStyle(fontSize: height*0.02),)),
            SizedBox(width: 10,),

            Checkbox(
                value: controller.employees[0].holidays!.contains('Mon'),
                activeColor:
                Constants.mainColor2,
                onChanged: (value){
                  controller.chooseHolidays(0,'Mon');

                }),
            InkWell(
                onTap: (){
                  controller.chooseHolidays(0,'Mon');
                },
                child: Text('Mon',style: TextStyle(fontSize: height*0.02),)),

          ],
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
                value: controller.employees[0].holidays!.contains('Tue'),
                activeColor:
                Constants.mainColor2,
                onChanged: (value){
                  controller.chooseHolidays(0,'Tue');

                }),
            InkWell(
                onTap: (){
                  controller.chooseHolidays(0,'Tue');
                },
                child: Text('Tue',style: TextStyle(fontSize: height*0.02),)),
            SizedBox(width: 10,),
            Checkbox(
                value: controller.employees[0].holidays!.contains('Wed'),
                activeColor:
                Constants.mainColor2,
                onChanged: (value){
                  controller.chooseHolidays(0,'Wed');

                }),
            InkWell(
                onTap: (){
                  controller.chooseHolidays(0,'Wed');
                },
                child: Text('Wed',style: TextStyle(fontSize: height*0.02),)),
            SizedBox(width: 10,),

            Checkbox(
                value: controller.employees[0].holidays!.contains('Thu'),
                activeColor:
                Constants.mainColor2,
                onChanged: (value){
                  controller.chooseHolidays(0,'Thu');

                }),
            InkWell(
                onTap: (){
                  controller.chooseHolidays(0,'Thu');
                },
                child: Text('Thu',style: TextStyle(fontSize: height*0.02),)),
            SizedBox(width: 10,),

          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
                value: controller.employees[0].holidays!.contains('Fri'),
                activeColor:
                Constants.mainColor2,
                onChanged: (value){
                  controller.chooseHolidays(0,'Fri');

                }),
            InkWell(
                onTap: (){
                  controller.chooseHolidays(0,'Fri');
                },
                child: Text('Fri',style: TextStyle(fontSize: height*0.02),)),

          ],
        ),



        SizedBox(height: 15,),
        Divider(),
        SizedBox(height: 10,),

        Text('Add employee works',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
            ),
            itemCount: controller.employees[i!].imageLength,

            itemBuilder: (context,j){

              return Stack(
                fit: StackFit.expand,
                children: [

                  InkWell(
                      onTap: (){

                        if(controller.employees[i!].workImages!.length==j)
                          controller.pickImage(i!);

                      },
                      child: AddWorksPic(image:controller.employees[i!].workImages!.length!=j?
                      controller.employees[i!].workImages![j]:null ,)),

                  if(controller.employees[i!].workImages!.length!=j)
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: InkWell(
                        onTap: (){
                          controller.removeImage(j);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Constants.mainColor2,
                              shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(Icons.delete_forever,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }),

        SizedBox(height: 15,),
        Divider(),
        SizedBox(height: 10,),
        Text('Choose employee services',
          style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),




        ListView.builder(
            itemCount: controller.employees[0].servicesModel!.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,j){

              return  InkWell(
                onTap: (){
                  controller.chooseService(0,j);
                },
                child: Container(
                    height: height*0.06,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 30),
                          child: Checkbox(
                              value: controller.employees[i!].servicesModel![j]
                                  .choose!,
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value) {
                                 controller.chooseService(0,j);
                              }),
                        ),
                        Text(controller.employees[i!].servicesModel![j].title!.en!,style: TextStyle(
                            fontSize: height*0.02
                        ),),
                      ],
                    )),
              );
            }
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: (){
            controller.checkCanWorkInHome(0);
          },
          child: Container(
              height: height*0.06,
              child: Row(
                children: [
                  Switch(
                      value: controller.employees[0].workOut!,
                      activeColor:
                      Constants.mainColor2,
                      onChanged: (value) {
                        controller.checkCanWorkInHome(0);
                      }),
                  Text('Employee can work in client home',style: TextStyle(
                      fontSize: height*0.02
                  ),),
                ],
              )),
        ),
        SizedBox(height: 40,),


      ],
    ):
     Padding(
       padding: const EdgeInsets.symmetric(vertical: 15),
       child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Constants.mainColor2)
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            textColor: Constants.mainColor2,
            iconColor: Constants.mainColor2,

            title: Text('Employee ${i!+1}',style: TextStyle(fontSize: height*0.02),),
          children: [
            Column(
              children: [
                Text('Employee Photo',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      controller.pickEmployeePhoto(i!);
                    },
                    child: Container(
                      height: height*0.15,
                      width: height*0.15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Constants.mainColor2,width: 2)
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          controller.employees.isNotEmpty&&controller.employees[i!].photo!=null?
                          ClipOval(
                              child: Image.file(controller.employees[i!].photo!,
                                height: height*0.145,
                                width: height*0.145,
                                fit: BoxFit.cover,
                              )):
                          Icon(Icons.person,color: Colors.black38,size: 60,),

                          Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Icon(Icons.add_a_photo,color: Colors.white,size: 15,),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      cursorColor: Constants.mainColor2,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 1, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 1, color: Constants.mainColor2),
                        ),
                        labelText: 'Employee Name',
                        labelStyle: TextStyle(color:Constants.mainColor2,
                            fontWeight: FontWeight.bold,fontSize: 14),
                        prefixIcon:Icon(Icons.person,
                            color: Constants.mainColor2),
                      ),
                      onChanged: (value){
                        controller.setEmployeeName(i!, value);
                      },

                      validator: (value){},
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      cursorColor: Constants.mainColor2,
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 1, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 1, color: Constants.mainColor2),
                        ),
                        labelText: 'Employee Phone',
                        labelStyle: TextStyle(color:Constants.mainColor2,
                            fontWeight: FontWeight.bold,fontSize: 14),
                        prefixIcon:Icon(Icons.phone,
                            color: Constants.mainColor2),
                      ),
                      onChanged: (value){
                        controller.setEmployeePhone(i!, value);
                      },

                      validator: (value){},
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Divider(),
                SizedBox(height: 10,),
                Text('Working Time',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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
                              controller.setEmployeeTime(0,true,value!);

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
                                  controller.employees.isNotEmpty&&controller.employees[0].availableFrom!=null?
                                  localizations.formatTimeOfDay(controller.employees[0].availableFrom!):
                                  ' 09:00 Am'
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
                              controller.setEmployeeTime(0,false,value!);

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
                                  controller.employees.isNotEmpty&&controller.employees[0].availableTo!=null?
                                  localizations.formatTimeOfDay(controller.employees[0].availableTo!):
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
                Text('Holidays',
                  style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: controller.employees[i!].holidays!.contains('Sat'),
                        activeColor:
                        Constants.mainColor2,
                        onChanged: (value){
                          controller.chooseHolidays(i!,'Sat');

                        }),
                    InkWell(
                        onTap: (){
                          controller.chooseHolidays(i!,'Sat');
                        },
                        child: Text('Sat',style: TextStyle(fontSize: height*0.02),)),
                    SizedBox(width: 10,),

                    Checkbox(
                        value: controller.employees[i!].holidays!.contains('Sun'),
                        activeColor:
                        Constants.mainColor2,
                        onChanged: (value){
                          controller.chooseHolidays(i!,'Sun');

                        }),
                    InkWell(
                        onTap: (){
                          controller.chooseHolidays(i!,'Sun');
                        },
                        child: Text('Sun',style: TextStyle(fontSize: height*0.02),)),
                    SizedBox(width: 10,),

                    Checkbox(
                        value: controller.employees[i!].holidays!.contains('Mon'),
                        activeColor:
                        Constants.mainColor2,
                        onChanged: (value){
                          controller.chooseHolidays(i!,'Mon');

                        }),
                    InkWell(
                        onTap: (){
                          controller.chooseHolidays(i!,'Mon');
                        },
                        child: Text('Mon',style: TextStyle(fontSize: height*0.02),)),

                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: controller.employees[i!].holidays!.contains('Tue'),
                        activeColor:
                        Constants.mainColor2,
                        onChanged: (value){
                          controller.chooseHolidays(i!,'Tue');

                        }),
                    InkWell(
                        onTap: (){
                          controller.chooseHolidays(i!,'Tue');
                        },
                        child: Text('Tue',style: TextStyle(fontSize: height*0.02),)),
                    SizedBox(width: 10,),
                    Checkbox(
                        value: controller.employees[i!].holidays!.contains('Wed'),
                        activeColor:
                        Constants.mainColor2,
                        onChanged: (value){
                          controller.chooseHolidays(i!,'Wed');

                        }),
                    InkWell(
                        onTap: (){
                          controller.chooseHolidays(i!,'Wed');
                        },
                        child: Text('Wed',style: TextStyle(fontSize: height*0.02),)),
                    SizedBox(width: 10,),

                    Checkbox(
                        value: controller.employees[i!].holidays!.contains('Thu'),
                        activeColor:
                        Constants.mainColor2,
                        onChanged: (value){
                          controller.chooseHolidays(i!,'Thu');

                        }),
                    InkWell(
                        onTap: (){
                          controller.chooseHolidays(i!,'Thu');
                        },
                        child: Text('Thu',style: TextStyle(fontSize: height*0.02),)),
                    SizedBox(width: 10,),

                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: controller.employees[i!].holidays!.contains('Fri'),
                        activeColor:
                        Constants.mainColor2,
                        onChanged: (value){
                          controller.chooseHolidays(i!,'Fri');

                        }),
                    InkWell(
                        onTap: (){
                          controller.chooseHolidays(i!,'Fri');
                        },
                        child: Text('Fri',style: TextStyle(fontSize: height*0.02),)),

                  ],
                ),



                SizedBox(height: 15,),
                Divider(),
                SizedBox(height: 10,),

                Text('Add employee works',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: controller.employees[i!].imageLength!,

                    itemBuilder: (context,j){

                      return Stack(
                        fit: StackFit.expand,
                        children: [

                          InkWell(
                              onTap: (){

                                if(controller.employees[i!].workImages!.length==j)
                                  controller.pickImage(i!);

                              },
                              child: AddWorksPic(image:controller.employees[i!].workImages!.length!=j?
                              controller.employees[i!].workImages![j]:null ,)),

                          if(controller.employees[i!].workImages!.length!=j)
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: (){
                                  controller.removeImage(j);
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Constants.mainColor2,
                                      shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: Icon(Icons.delete_forever,color: Colors.white,),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }),

                SizedBox(height: 15,),
                Divider(),
                SizedBox(height: 10,),
                Text('Choose employee services',
                  style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                ListView.builder(
                    itemCount: controller.employees[i!].servicesModel!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,j){

                      return  InkWell(
                        onTap: (){
                           controller.chooseService(i!,j);
                        },
                        child: Container(
                            height: height*0.06,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 30),
                                  child: Checkbox(
                                      value: controller.employees[i!].servicesModel![j]
                                          .choose!,
                                      activeColor:
                                      Constants.mainColor2,
                                      onChanged: (value) {
                                         controller.chooseService(i!,j);
                                      }),
                                ),
                                Text(controller.employees[i!].servicesModel![j].title!.en!,style: TextStyle(
                                    fontSize: height*0.02
                                ),),
                              ],
                            )),
                      );
                    }
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    controller.checkCanWorkInHome(i!);
                  },
                  child: Container(
                      height: height*0.06,
                      child: Row(
                        children: [
                          Switch(
                              value: controller.employees[i!].workOut!,
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value) {
                                controller.checkCanWorkInHome(i!);
                              }),
                          Text('Employee can work in client home',style: TextStyle(
                              fontSize: height*0.02
                          ),),
                        ],
                      )),
                ),
                SizedBox(height: 30,),


              ],
            )
          ],
          ),
        ),
    ),
     );
  }
}
