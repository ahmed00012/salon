


import 'package:beauty_center/view/widgets/time_picker_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../provider/center_registration_provider3.dart';
import 'add_works_picture.dart';
import 'default_text_field.dart';

class PackageWidget extends ConsumerWidget {
  PackageWidget({Key? key,this.i}) : super(key: key);
  int ?i;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture3);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return
      controller.packages.length<2?
      Column(
        children: [

          Align(
            alignment: Alignment.centerLeft,
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
              controller.choseForBride();
            },
            child: Row(

              children: [
              Radio(value: true,
                  activeColor: Constants.mainColor2,
                  groupValue: controller.bride,
                  onChanged: (value){
                    controller.choseForBride();
                  }),
                Text('  Bride ',style: TextStyle(fontSize: height*0.02),)
              ],
            ),
          ),
          InkWell(
            onTap: (){
              controller.choseForBride();
            },
            child: Row(

              children: [
              Radio(value: false,
                  activeColor: Constants.mainColor2,
                  groupValue: controller.bride,
                  onChanged: (value){
                    controller.choseForBride();
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
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),
          Text('Package Type',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              controller.setPackage(i!,extraService: false);
            },
            child: Row(

              children: [
                Radio(value: false,
                    activeColor: Constants.mainColor2,
                    groupValue: controller.packages[i!].extraService,
                    onChanged: (value){
                      controller.setPackage(i!,extraService: false);
                    }),
                Text('  Price Discount ',style: TextStyle(fontSize: height*0.02),)
              ],
            ),
          ),
          InkWell(
            onTap: (){
              controller.setPackage(i!,extraService: true);
            },
            child: Row(

              children: [
                Radio(value: true,
                    activeColor: Constants.mainColor2,
                    groupValue: controller.packages[i!].extraService,
                    onChanged: (value){
                      controller.setPackage(i!,extraService: true);
                    }),
                Text(' Extra Service ',style: TextStyle(fontSize: height*0.02),)
              ],
            ),
          ),
          SizedBox(height: 15,),
          Divider(),
          SizedBox(height: 10,),

          if(controller.packages[i!].extraService!)
          Text('Free Services',
            style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
          if(controller.packages[i!].extraService!)
          SizedBox(height: 20,),
          if(controller.packages[i!].extraService!)
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

          if(!controller.packages[i!].extraService!)
            Row(
              children: [
                Container(
                    height: height*0.065,
                    width: width*0.6,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: DefaultTextField(icon: Icons.discount,label: 'Price After Discount',number: true,)),
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
                        controller.choseForBride();
                      },
                      child: Row(

                        children: [
                          Radio(value: true,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.bride,
                              onChanged: (value){
                                controller.choseForBride();
                              }),
                          Text('  Bride ',style: TextStyle(fontSize: height*0.02),)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.choseForBride();
                      },
                      child: Row(

                        children: [
                          Radio(value: false,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.bride,
                              onChanged: (value){
                                controller.choseForBride();
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
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),
                    Text('Package Type',style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        controller.setPackage(i!,extraService: false);
                      },
                      child: Row(

                        children: [
                          Radio(value: false,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.packages[i!].extraService,
                              onChanged: (value){
                                controller.setPackage(i!,extraService: false);
                              }),
                          Text('  Price Discount ',style: TextStyle(fontSize: height*0.02),)
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.setPackage(i!,extraService: true);
                      },
                      child: Row(

                        children: [
                          Radio(value: true,
                              activeColor: Constants.mainColor2,
                              groupValue: controller.packages[i!].extraService,
                              onChanged: (value){
                                controller.setPackage(i!,extraService: true);
                              }),
                          Text(' Extra Service ',style: TextStyle(fontSize: height*0.02),)
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Divider(),
                    SizedBox(height: 10,),

                    if(controller.packages[i!].extraService!)
                      Text('Free Services',
                        style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                    if(controller.packages[i!].extraService!)
                      SizedBox(height: 20,),
                    if(controller.packages[i!].extraService!)
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

                    if(!controller.packages[i!].extraService!)
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
                              child: DefaultTextField(icon: Icons.discount,label: 'Price After Discount',number: true,)),
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
