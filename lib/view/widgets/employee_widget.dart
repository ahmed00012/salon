


import 'package:beauty_center/view/widgets/time_picker_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../provider/center_registration_provider3.dart';
import 'add_works_picture.dart';
import 'default_text_field.dart';

class EmployeeWidget extends ConsumerWidget {
   EmployeeWidget({Key? key,this.i}) : super(key: key);
  int ?i;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture3);
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
                  controller.employees.isNotEmpty&&controller.employees[0].photo!=null?
                  ClipOval(
                      child: Image.file(controller.employees[0].photo!,
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
        Align(
          alignment: Alignment.center,
          child: Container(
              height: height*0.065,
              width: width*0.7,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: DefaultTextField(icon: Icons.person,label: 'Employee Name',)),
        ),
        SizedBox(height: 20,),
        Align(
          alignment: Alignment.center,
          child: Container(
              height: height*0.065,
              width: width*0.7,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: DefaultTextField(icon: Icons.phone,label: 'Employee Phone',)),
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
                      controller.setEmployee(0,timeFrom: value);

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
                      controller.setEmployee(0,timeTo: value);

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
            itemCount: controller.imageLength,

            itemBuilder: (context,i){

              return Stack(
                fit: StackFit.expand,
                children: [

                  InkWell(
                      onTap: (){

                        if(controller.images.length==i)
                          controller.pickImage();

                      },
                      child: AddWorksPic(image:controller.images.length!=i?
                      controller.images[i]:null ,)),

                  if(controller.images.length!=i)
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: InkWell(
                        onTap: (){
                          controller.removeImage(i);
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



        InkWell(
          onTap: (){
            controller.checkCanWorkInHome();
          },
          child: Container(
              height: height*0.06,
              child: Row(
                children: [
                  Checkbox(
                      value: controller.workInHome,
                      activeColor:
                      Constants.mainColor2,
                      onChanged: (value) {
                        controller.checkCanWorkInHome();
                      }),
                  Text('Can work in client home',style: TextStyle(
                      fontSize: height*0.02
                  ),),
                ],
              )),
        ),
        ListView.builder(
            itemCount: controller.categories.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,i){

              return  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1),
                  ),
                  child: ExpansionTile(
                    title: Text(controller.categories[i].name!),
                    iconColor: Constants.mainColor2,
                    textColor: Constants.mainColor2,
                    children: [
                      ListView.builder(
                          itemCount: controller.categories[i].subcategory!.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,j){
                            return InkWell(
                              onTap: (){
                                controller.chooseCategory(i,j);
                              },
                              child: Container(
                                  height: height*0.06,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 30),
                                        child: Checkbox(
                                            value: controller.categories[i]
                                                .subcategory![j].choose,
                                            activeColor:
                                            Constants.mainColor2,
                                            onChanged: (value) {
                                              controller.chooseCategory(i,j);
                                            }),
                                      ),
                                      Text(controller.categories[i]
                                          .subcategory![j].name!,style: TextStyle(
                                          fontSize: height*0.02
                                      ),),
                                    ],
                                  )),
                            );
                          })
                    ],
                  ),
                ),
              );
            }
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
                      controller.pickEmployeePhoto(0);
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
                          controller.employees.isNotEmpty&&controller.employees[0].photo!=null?
                          ClipOval(
                              child: Image.file(controller.employees[0].photo!,
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
                Container(
                    height: height*0.065,
                    width: width*0.7,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: DefaultTextField(icon: Icons.person,label: 'Employee Name',)),
                SizedBox(height: 20,),
                 Container(
                     height: height*0.065,
                     width: width*0.7,

                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: DefaultTextField(icon: Icons.phone,label: 'Employee Phone',)),
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
                              controller.setEmployee(0,timeFrom: value);

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
                              controller.setEmployee(0,timeTo: value);

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
                    itemCount: controller.imageLength,

                    itemBuilder: (context,i){

                      return Stack(
                        fit: StackFit.expand,
                        children: [

                          InkWell(
                              onTap: (){

                                if(controller.images.length==i)
                                  controller.pickImage();

                              },
                              child: AddWorksPic(image:controller.images.length!=i?
                              controller.images[i]:null ,)),

                          if(controller.images.length!=i)
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: (){
                                  controller.removeImage(i);
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



                InkWell(
                  onTap: (){
                    controller.checkCanWorkInHome();
                  },
                  child: Container(
                      height: height*0.06,
                      child: Row(
                        children: [
                          Checkbox(
                              value: controller.workInHome,
                              activeColor:
                              Constants.mainColor2,
                              onChanged: (value) {
                                controller.checkCanWorkInHome();
                              }),
                          Text('Can work in client home',style: TextStyle(
                              fontSize: height*0.02
                          ),),
                        ],
                      )),
                ),
                ListView.builder(
                    itemCount: controller.categories.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,i){

                      return  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                          ),
                          child: ExpansionTile(
                            title: Text(controller.categories[i].name!),
                            iconColor: Constants.mainColor2,
                            textColor: Constants.mainColor2,
                            children: [
                              ListView.builder(
                                  itemCount: controller.categories[i].subcategory!.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context,j){
                                    return InkWell(
                                      onTap: (){
                                        controller.chooseCategory(i,j);
                                      },
                                      child: Container(
                                          height: height*0.06,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(left: 30),
                                                child: Checkbox(
                                                    value: controller.categories[i]
                                                        .subcategory![j].choose,
                                                    activeColor:
                                                    Constants.mainColor2,
                                                    onChanged: (value) {
                                                      controller.chooseCategory(i,j);
                                                    }),
                                              ),
                                              Text(controller.categories[i]
                                                  .subcategory![j].name!,style: TextStyle(
                                                  fontSize: height*0.02
                                              ),),
                                            ],
                                          )),
                                    );
                                  })
                            ],
                          ),
                        ),
                      );
                    }
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
