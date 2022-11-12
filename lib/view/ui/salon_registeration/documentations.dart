

import 'package:beauty_center/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../../provider/center_registration_provider1.dart';
import '../../../provider/center_registration_provider2.dart';
import '../../widgets/add_licence.dart';
import '../../widgets/add_works_picture.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';
import 'choose_categories.dart';

class AddDocumentations extends ConsumerWidget {
  const AddDocumentations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture2);
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
                        child: ListView(
                      children: [

                        Center(child: Text('pick your licences and cirtifications')),
                        SizedBox(height: 20,),
                        GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                        ),
                            itemCount: controller.licenceLength,

                            itemBuilder: (context,i){

                          return Stack(
                            fit: StackFit.expand,
                            children: [

                              InkWell(
                                  onTap: (){
                                    if(controller.licences.length==i)
                                    controller.pickLicence();
                                  },
                                  child: AddLicence(licence:controller.licences.length!=i?
                                  controller.licences[i]:null ,)),

                              if(controller.licences.length!=i)
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: InkWell(
                                  onTap: (){
                                    controller.removeLicence(i);
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
                        SizedBox(height: 20,),

                        Row(children: [
                          Spacer(),
                          InkWell(
                            onTap:(){

                              controller.addLicence();

                },
                            child: Container(
                              height: height*0.06,
                              width:height*0.06,
                              decoration: BoxDecoration(
                                color: Constants.mainColor2,
                                shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Icon(Icons.add,color: Colors.white,size: 30,),
                              ),
                            ),
                          )
                        ],),

                        SizedBox(height: 20,),

                        Divider(),
                        SizedBox(height: 10,),
                        Center(child: Text('Add your previous works')),
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
                        SizedBox(height: 20,),

                        Row(children: [
                          Spacer(),
                          InkWell(
                            onTap:(){

                              controller.addImage();

                            },
                            child: Container(
                              height: height*0.06,
                              width:height*0.06,
                              decoration: BoxDecoration(
                                  color: Constants.mainColor2,
                                  shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Icon(Icons.add,color: Colors.white,size: 30,),
                              ),
                            ),
                          )
                        ],),

                        SizedBox(height: 50,),


                        Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>ChooseCategories()));

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
                    )),

                    VerticalProgress(height: height,progressHeight: height/2,index: 3,),
                  ],
                );
              }),

          )

        ],
      ),

    );
  }
}
