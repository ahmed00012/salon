

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/edit_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/center_registration_provider1.dart';
import '../../../provider/center_registration_provider2.dart';

import '../../widgets/add_works_picture.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';
import 'edit_categories.dart';

class EditWorkImages extends ConsumerWidget {
  const EditWorkImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(editInfoFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          MyAppBar(title: 'Documentations',),
          Expanded(
            child: StatefulBuilder(

                builder: (context,setState){
                  return ListView(
                    shrinkWrap: true,
                    children: [
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


                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.2),
                        child: InkWell(
                          onTap: (){



                          },
                          child: Container(
                            height: height*0.06,
                            width: width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Constants.mainColor2
                            ),
                            child: Center(
                              child: Text('Done',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  );
                }),
          )

        ],
      ),

    );
  }
}
