


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

          Align(
            alignment: Alignment.center,
            child: Container(
                height: height*0.065,
                width: width*0.7,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DefaultTextField(icon: Icons.person,label: 'Package Title',)),
          ),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Text('Package For',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              controller.checkForPride(0);
            },
            child: Row(

              children: [
              Radio(value: true,
                  activeColor: Constants.mainColor2,
                  groupValue: controller.bride,
                  onChanged: (value){
                    controller.checkForPride(0);
                  }),
                Text('  Bride ',style: TextStyle(fontSize: height*0.02),)
              ],
            ),
          ),
          InkWell(
            onTap: (){
              controller.checkForPride(0);
            },
            child: Row(

              children: [
              Radio(value: false,
                  activeColor: Constants.mainColor2,
                  groupValue: controller.bride,
                  onChanged: (value){
                    controller.checkForPride(0);
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
              itemCount: controller.services.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,j){

                return  InkWell(
                  onTap: (){
                    // controller.chooseService(i,j);
                  },
                  child: Container(
                      height: height*0.06,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 30),
                            child: Checkbox(
                                value: controller.services[j].choose,
                                activeColor:
                                Constants.mainColor2,
                                onChanged: (value) {
                                  // controller.chooseService(i,j);
                                }),
                          ),
                          Text(controller.services[j].title!.en!,style: TextStyle(
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
                Container(
                    height: height*0.065,
                    width: width*0.6,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: DefaultTextField(icon: Icons.discount,label: 'Price',number: true,)),
                Text('   EGP')
              ],
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
                    Container(
                        height: height*0.065,
                        width: width*0.7,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: DefaultTextField(icon: Icons.person,label: 'Package Title',)),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),
                    Text('Package For',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        controller.checkForPride(i!);
                      },
                      child: Row(

                        children: [
                          Radio(value: true,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.bride,
                              onChanged: (value){
                                controller.checkForPride(i!);
                              }),
                          Text('  Bride ',style: TextStyle(fontSize: height*0.02),)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.checkForPride(i!);
                      },
                      child: Row(

                        children: [
                          Radio(value: false,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.bride,
                              onChanged: (value){
                                controller.checkForPride(i!);
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
                        itemCount: controller.services.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,j){

                          return  InkWell(
                            onTap: (){
                              // controller.chooseService(i,j);
                            },
                            child: Container(
                                height: height*0.06,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 30),
                                      child: Checkbox(
                                          value: controller.services[j].choose,
                                          activeColor:
                                          Constants.mainColor2,
                                          onChanged: (value) {
                                            // controller.chooseService(i,j);
                                          }),
                                    ),
                                    Text(controller.services[j].title!.en!,style: TextStyle(
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
                        Container(
                            height: height*0.065,
                            width: width*0.6,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: DefaultTextField(icon: Icons.discount,label: 'Price',number: true,)),
                        Text('   EGP')
                      ],
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
