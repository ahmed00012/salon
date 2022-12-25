


import 'package:beauty_center/view/widgets/time_picker_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../provider/employee_provider.dart';
import '../../provider/package_provider.dart';
import 'add_works_picture.dart';
import 'default_text_field.dart';

class PackageWidget extends ConsumerWidget {
  PackageWidget({Key? key,this.i}) : super(key: key);
  int ?i;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(packageFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return
      controller.packages.length<2?
      Column(
        children: [
          Text('Package Photo',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                controller.pickPackageImage(i!);
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
                    controller.packages.isNotEmpty&&controller.packages[i!].image!=null?
                    ClipOval(
                        child: Image.file(controller.packages[i!].image!,
                          height: height*0.145,
                          width: height*0.145,
                          fit: BoxFit.cover,
                        )):
                    Icon(Icons.camera_alt_outlined,color: Colors.black38,size: 60,),

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
                decoration: const InputDecoration(
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
                  labelText: 'Package Title English',
                  labelStyle: TextStyle(color:Constants.mainColor2,
                      fontWeight: FontWeight.bold,fontSize: 14),
                  prefixIcon:Icon(Icons.title,
                      color: Constants.mainColor2),
                ),
                onChanged: (value){
                 controller.setPackageTitle(value,i!,false);
                },

                validator: (value){},
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: width*0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                cursorColor: Constants.mainColor2,
                decoration: const InputDecoration(
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
                  labelText: 'Package Title Arabic',
                  labelStyle: TextStyle(color:Constants.mainColor2,
                      fontWeight: FontWeight.bold,fontSize: 14),
                  prefixIcon:Icon(Icons.title,
                      color: Constants.mainColor2),
                ),
                onChanged: (value){
                  controller.setPackageTitle(value,i!,true);
                },

                validator: (value){},
              ),
            ),
          ),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Text('Package For',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              controller.checkForPride(i!,true);
            },
            child: Row(

              children: [
              Radio(value: true,
                  activeColor: Constants.mainColor2,
                  groupValue: controller.packages[i!].isPride,
                  onChanged: (value){
                    controller.checkForPride(i!,true);
                  }),
                Text('  Bride ',style: TextStyle(fontSize: height*0.02),)
              ],
            ),
          ),
          InkWell(
            onTap: (){
              controller.checkForPride(i!,false);
            },
            child: Row(

              children: [
              Radio(value: false,
                  activeColor: Constants.mainColor2,
                  groupValue: controller.packages[i!].isPride,
                  onChanged: (value){
                    controller.checkForPride(i!,false);
                  }),
                Text('  non Bride ',style: TextStyle(fontSize: height*0.02),)
              ],
            ),
          ),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Text('Services',
            style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          ListView.builder(
              itemCount: controller.packages[i!].servicesModel!.length,
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
                            const EdgeInsets.only(left: 5),
                            child: Checkbox(
                                value: controller.packages[i!].servicesModel![j].choose,
                                activeColor:
                                Constants.mainColor2,
                                onChanged: (value) {
                                  controller.chooseService(i!,j);
                                }),
                          ),
                          Text(controller.packages[i!].servicesModel![j].title!.en!,style: TextStyle(
                              fontSize: height*0.02
                          ),),
                        ],
                      )),
                );
              }
          ),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Text('Package Price',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: width*0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      cursorColor: Constants.mainColor2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
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
                        labelText: 'Price Before Discount',
                        labelStyle: TextStyle(color:Constants.mainColor2,
                            fontWeight: FontWeight.bold,fontSize: 14),
                        prefixIcon:Icon(Icons.discount,
                            color: Constants.mainColor2),
                      ),
                      onChanged: (value){
                        controller.setPrice(i!, true,value);
                      },

                      validator: (value){},
                    ),
                  ),
                ),
                Text('   EGP')
              ],
            ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: width*0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    cursorColor: Constants.mainColor2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
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
                      labelText: 'Price After Discount',
                      labelStyle: TextStyle(color:Constants.mainColor2,
                          fontWeight: FontWeight.bold,fontSize: 14),
                      prefixIcon:Icon(Icons.discount,
                          color: Constants.mainColor2),
                    ),
                    onChanged: (value){
                      controller.setPrice(i!, false,value);

                    },

                    validator: (value){},
                  ),
                ),
              ),
              Text('   EGP')
            ],
          ),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Text('Package Available To',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              showDatePicker(context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year+2),
                builder: (context,child){
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Constants.mainColor2,
                      onSurface: Colors.black,
                    ),
                    timePickerTheme:
                    TimePickerThemeData(
                      entryModeIconColor: Colors.black26,
                      dialBackgroundColor: Colors.grey[100],
                      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.selected)
                          ? Color(0xfffc9b00).withOpacity(0.1)
                          : Colors.grey[100]!),
                    ),
                    buttonTheme: ButtonThemeData(
                      colorScheme: ColorScheme.light(
                        primary: Constants.mainColor2,
                      ),
                    ),
                    textTheme: TextTheme(

                      overline: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                  child: child!,
                );

                }
              ).then((value) {
                if(value!=null)
                controller.setDate(value, i!);

              });

            },
            child: Container(
              height: height*0.06,
              width: width*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black38)
              ),
              child:  Center(
                child: Text(
                   controller.packages[i!].to!,
                  style: TextStyle(
                    fontSize: height*0.02
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Text('Description',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Container(
            width: width*0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              cursorColor: Constants.mainColor2,
              keyboardType: TextInputType.number,
              maxLines: 5,
              decoration: const InputDecoration(
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
                labelText: 'Description English',
                labelStyle: TextStyle(color:Constants.mainColor2,
                    fontWeight: FontWeight.bold,fontSize: 14),
                prefixIcon:Icon(Icons.info_outline,
                    color: Constants.mainColor2),
              ),
              onChanged: (value){
                controller.setPackageDescription(value, i!,false);

              },

              validator: (value){},
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: width*0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              cursorColor: Constants.mainColor2,
              keyboardType: TextInputType.number,
              maxLines: 5,
              decoration: const InputDecoration(
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
                labelText: 'Description Arabic',
                labelStyle: TextStyle(color:Constants.mainColor2,
                    fontWeight: FontWeight.bold,fontSize: 14),
                prefixIcon:Icon(Icons.info_outline,
                    color: Constants.mainColor2),
              ),
              onChanged: (value){
                controller.setPackageDescription(value, i!,true);

              },

              validator: (value){},
            ),
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

              title: Text('Package ${i!+1}',style: TextStyle(fontSize: height*0.02),),
              children: [
                Column(
                  children: [
                    Text('Package Photo',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          controller.pickPackageImage(i!);
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
                              controller.packages.isNotEmpty&&controller.packages[i!].image!=null?
                              ClipOval(
                                  child: Image.file(controller.packages[i!].image!,
                                    height: height*0.145,
                                    width: height*0.145,
                                    fit: BoxFit.cover,
                                  )):
                              Icon(Icons.camera_alt_outlined,color: Colors.black38,size: 60,),

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
                          decoration: const InputDecoration(
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
                            labelText: 'Package Title English',
                            labelStyle: TextStyle(color:Constants.mainColor2,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon:Icon(Icons.title,
                                color: Constants.mainColor2),
                          ),
                          onChanged: (value){
                            controller.setPackageTitle(value,i!,false);
                          },

                          validator: (value){},
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: width*0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: Constants.mainColor2,
                          decoration: const InputDecoration(
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
                            labelText: 'Package Title Arabic',
                            labelStyle: TextStyle(color:Constants.mainColor2,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon:Icon(Icons.title,
                                color: Constants.mainColor2),
                          ),
                          onChanged: (value){
                            controller.setPackageTitle(value,i!,true);
                          },

                          validator: (value){},
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),
                    Text('Package For',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        controller.checkForPride(i!,true);
                      },
                      child: Row(

                        children: [
                          Radio(value: true,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.packages[i!].isPride,
                              onChanged: (value){
                                controller.checkForPride(i!,true);
                              }),
                          Text('  Bride ',style: TextStyle(fontSize: height*0.02),)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.checkForPride(i!,false);
                      },
                      child: Row(

                        children: [
                          Radio(value: false,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.packages[i!].isPride,
                              onChanged: (value){
                                controller.checkForPride(i!,false);
                              }),
                          Text('  non Bride ',style: TextStyle(fontSize: height*0.02),)
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),
                    Text('Services',
                      style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    ListView.builder(
                        itemCount: controller.packages[i!].servicesModel!.length,
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
                                      const EdgeInsets.only(left: 5),
                                      child: Checkbox(
                                          value: controller.packages[i!].servicesModel![j].choose,
                                          activeColor:
                                          Constants.mainColor2,
                                          onChanged: (value) {
                                             controller.chooseService(i!,j);
                                          }),
                                    ),
                                    Text(controller.packages[i!].servicesModel![j].title!.en!,style: TextStyle(
                                        fontSize: height*0.02
                                    ),),
                                  ],
                                )),
                          );
                        }
                    ),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),
                    Text('Package Price',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: width*0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              cursorColor: Constants.mainColor2,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
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
                                labelText: 'Price Before Discount',
                                labelStyle: TextStyle(color:Constants.mainColor2,
                                    fontWeight: FontWeight.bold,fontSize: 14),
                                prefixIcon:Icon(Icons.discount,
                                    color: Constants.mainColor2),
                              ),
                              onChanged: (value){
                                controller.setPrice(i!, true,value);
                              },

                              validator: (value){},
                            ),
                          ),
                        ),
                        Text('   EGP')
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: width*0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              cursorColor: Constants.mainColor2,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
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
                                labelText: 'Price After Discount',
                                labelStyle: TextStyle(color:Constants.mainColor2,
                                    fontWeight: FontWeight.bold,fontSize: 14),
                                prefixIcon:Icon(Icons.discount,
                                    color: Constants.mainColor2),
                              ),
                              onChanged: (value){
                                controller.setPrice(i!, false,value);

                              },

                              validator: (value){},
                            ),
                          ),
                        ),
                        Text('   EGP')
                      ],
                    ),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),
                    Text('Package Available To',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        showDatePicker(context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year+2),
                            builder: (context,child){
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Constants.mainColor2,
                                    onSurface: Colors.black,
                                  ),
                                  timePickerTheme:
                                  TimePickerThemeData(
                                    entryModeIconColor: Colors.black26,
                                    dialBackgroundColor: Colors.grey[100],
                                    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                                    states.contains(MaterialState.selected)
                                        ? Color(0xfffc9b00).withOpacity(0.1)
                                        : Colors.grey[100]!),
                                  ),
                                  buttonTheme: ButtonThemeData(
                                    colorScheme: ColorScheme.light(
                                      primary: Constants.mainColor2,
                                    ),
                                  ),
                                  textTheme: TextTheme(

                                    overline: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                                child: child!,
                              );

                            }
                        ).then((value) {
                          if(value!=null)
                            controller.setDate(value, i!);

                        });

                      },
                      child: Container(
                        height: height*0.06,
                        width: width*0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black38)
                        ),
                        child:  Center(
                          child: Text(
                            controller.packages[i!].to!,
                            style: TextStyle(
                                fontSize: height*0.02
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),
                    Text('Description',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Container(
                      width: width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        cursorColor: Constants.mainColor2,
                        keyboardType: TextInputType.number,
                        maxLines: 5,
                        decoration: const InputDecoration(
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
                          labelText: 'Description English',
                          labelStyle: TextStyle(color:Constants.mainColor2,
                              fontWeight: FontWeight.bold,fontSize: 14),
                          prefixIcon:Icon(Icons.info_outline,
                              color: Constants.mainColor2),
                        ),
                        onChanged: (value){
                          controller.setPackageDescription(value, i!,false);

                        },

                        validator: (value){},
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        cursorColor: Constants.mainColor2,
                        keyboardType: TextInputType.number,
                        maxLines: 5,
                        decoration: const InputDecoration(
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
                          labelText: 'Description Arabic',
                          labelStyle: TextStyle(color:Constants.mainColor2,
                              fontWeight: FontWeight.bold,fontSize: 14),
                          prefixIcon:Icon(Icons.info_outline,
                              color: Constants.mainColor2),
                        ),
                        onChanged: (value){
                          controller.setPackageDescription(value, i!,true);

                        },

                        validator: (value){},
                      ),
                    ),
                    SizedBox(height: 40,),


                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
