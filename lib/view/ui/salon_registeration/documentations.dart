

import 'package:beauty_center/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/center_registration_provider1.dart';
import '../../../provider/center_registration_provider2.dart';

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
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          MyAppBar(title: 'Documentations',),
          HorizontalProgress(index: 3,),
          SizedBox(height: 20,),
          Expanded(child: StatefulBuilder(

              builder: (context,setState){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                        child: ListView(
                          shrinkWrap: true,
                      children: [

                        Center(child: Text('pick the licence',style:
                          TextStyle(
                            fontSize: height*0.02,fontWeight: FontWeight.bold
                          ),)),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child:
                            controller.licence!=null?
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(controller.licence!,fit: BoxFit.fill,
                                      height: height*0.15,
                                      width: width*0.4,)),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: (){
                                      controller.removeLicence();
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
                            ):
                            InkWell(
                              onTap: (){
                                controller.pickLicence();
                              },
                              child: Container(
                                height: height*0.15,
                                width: width*0.4,

                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black38)
                                ),
                                child: Center(
                                  child: Icon(Icons.add,size: 30,color: Colors.black38,),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(child: Text('pick your Certification',style:
                        TextStyle(
                            fontSize: height*0.02,fontWeight: FontWeight.bold
                        ),)),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child:
                            controller.certification!=null?
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(controller.certification!,fit: BoxFit.fill,
                                      height: height*0.15,
                                      width: width*0.4,)),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: (){
                                      controller.removeCertification();
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
                            ):
                            InkWell(
                              onTap: (){
                                controller.pickCertification();
                              },
                              child: Container(
                                height: height*0.15,
                                width: width*0.4,

                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black38)
                                ),
                                child: Center(
                                  child: Icon(Icons.add,size: 30,color: Colors.black38,),
                                ),
                              ),
                            ),
                          ),
                        ),


                        SizedBox(height: 20,),
                        Center(child: Text('Add your previous works',style:
                        TextStyle(
                            fontSize: height*0.02,fontWeight: FontWeight.bold
                        ),)),
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
                                          controller.pickImageSalon();

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
                        SizedBox(height: 50,),


                        Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: (){
                                controller.registerSalon(context);
                                // Navigator.push(context, MaterialPageRoute(builder: (_)=>ChooseCategories()));

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
