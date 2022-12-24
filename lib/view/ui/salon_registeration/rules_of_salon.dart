import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/ui/salon_registeration/good_job.dart';
import 'package:beauty_center/view/widgets/default_text_field.dart';
import 'package:beauty_center/view/widgets/employee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/center_registration_provider2.dart';
import '../../../provider/employee_provider.dart';
import '../../widgets/add_works_picture.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';

class RulesOfSalon extends ConsumerWidget {
  RulesOfSalon({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(employeeFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            title: 'Salon Rules',
          ),
          HorizontalProgress(index: 8,),
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

                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: InkWell(
                               onTap:(){
                                 setState(() {
                                   controller.pets = !controller.pets;
                                 });
                               },
                               child: Container(
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(15)
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [

                                     Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 10),
                                       child: Text('Pets Allowed',style: TextStyle(fontSize: height*0.02),),
                                     ),
                                     Switch(
                                       value: controller.pets,
                                       onChanged: (value) {
                                         setState(() {
                                           controller.pets = value;
                                         });
                                       },
                                       activeTrackColor: Constants.mainColor2,
                                       activeColor: Colors.white,
                                     ),

                                   ],
                                 ),
                               ),
                             ),
                           ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap:(){
                                    setState(() {
                                      controller.food = !controller.food;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text('Food And Drink Allowed',style: TextStyle(fontSize: height*0.02),),
                                        ),
                                        Switch(
                                          value: controller.food,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.food = value;
                                            });
                                          },
                                          activeTrackColor: Constants.mainColor2,
                                          activeColor: Colors.white,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap:(){
                                    setState(() {
                                      controller.children = !controller.children;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text('Children Allowed',style: TextStyle(fontSize: height*0.02),),
                                        ),
                                        Switch(
                                          value: controller.children,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.children = value;
                                            });
                                          },
                                          activeTrackColor: Constants.mainColor2,
                                          activeColor: Colors.white,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap:(){
                                    setState(() {
                                      controller.smoke = !controller.smoke;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text('Smoke Allowed',style: TextStyle(fontSize: height*0.02),),
                                        ),
                                        Switch(
                                          value: controller.smoke,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.smoke = value;
                                            });
                                          },
                                          activeTrackColor: Constants.mainColor2,
                                          activeColor: Colors.white,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap:(){
                                    setState(() {
                                      controller.material = !controller.material;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Container(
                                              width: width*0.5,
                                              child: Text('Client Can Use His Own Material',
                                                style: TextStyle(fontSize: height*0.02),)),
                                        ),
                                        Switch(
                                          value: controller.material,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.material = value;
                                            });
                                          },
                                          activeTrackColor: Constants.mainColor2,
                                          activeColor: Colors.white,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap:(){
                                    setState(() {
                                      controller.wifi = !controller.wifi;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text('There Is Wifi',style: TextStyle(fontSize: height*0.02),),
                                        ),
                                        Switch(
                                          value: controller.wifi,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.wifi = value;
                                            });
                                          },
                                          activeTrackColor: Constants.mainColor2,
                                          activeColor: Colors.white,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap:(){
                                    setState(() {
                                      controller.photographer = !controller.photographer;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Container(
                                              width: width*0.5,
                                              child: Text('Client Can Bring His Photographer',style: TextStyle(fontSize: height*0.02),)),
                                        ),
                                        Switch(
                                          value: controller.photographer,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.photographer = value;
                                            });
                                          },
                                          activeTrackColor: Constants.mainColor2,
                                          activeColor: Colors.white,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap:(){
                                    setState(() {
                                      controller.cafeShop = !controller.cafeShop;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text('There Is Cafe Shop',style: TextStyle(fontSize: height*0.02),),
                                        ),
                                        Switch(
                                          value: controller.cafeShop,
                                          onChanged: (value) {
                                            setState(() {
                                              controller.cafeShop = value;
                                            });
                                          },
                                          activeTrackColor: Constants.mainColor2,
                                          activeColor: Colors.white,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),


                              SizedBox(height: 50,),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: (){

                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>GoodJob()));
                                    },
                                    child: Container(
                                      height: height*0.06,
                                      width: width*0.25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Constants.mainColor2
                                      ),
                                      child: Center(
                                        child: Text('Finish',style: TextStyle(color: Colors.white),),
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
                    progressHeight: height / 8,
                    index:8,
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

