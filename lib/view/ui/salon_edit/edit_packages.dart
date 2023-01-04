import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/ui/salon_registeration/rules_of_salon.dart';
import 'package:beauty_center/view/widgets/add_package_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/package_provider.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/vertical_progress.dart';

class PackagesEdit extends ConsumerWidget {
  PackagesEdit({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(packageFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            title: 'Packages',
          ),
          HorizontalProgress(index: 7,),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StatefulBuilder(builder: (context, setState) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child:ListView(
                            children: [

                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.packages.length,
                                  itemBuilder: (context,i){
                                    return PackageWidget(i: i,);
                                  }),
                              SizedBox(height: 40,),
                              InkWell(
                                onTap: (){
                                  controller.storePackage(controller.packages.last);
                                  controller.setPackage();
                                },
                                child: Container(
                                  height: height*0.065,
                                  decoration: BoxDecoration(
                                      color: Constants.mainColor2,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Center(
                                    child: Text('Add Another Package',style: TextStyle(color: Colors.white,
                                        fontSize: height*0.02),),
                                  ),
                                ),
                              ),


                              SizedBox(height: 50,),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      if(!controller.packages.last.saved!)
                                        controller.storePackage(controller.packages.last).then((value) {
                                          Navigator.pop(context);
                                        });
                                      else
                                        Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: height*0.06,
                                      width: width*0.25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Constants.mainColor2
                                      ),
                                      child: Center(
                                        child: Text('Next',style: TextStyle(color: Colors.white),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 40,),
                            ],
                          )
                      )

                  ),



                  VerticalProgress(
                    height: height,
                    progressHeight: height / 7,
                    index: 7,
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

