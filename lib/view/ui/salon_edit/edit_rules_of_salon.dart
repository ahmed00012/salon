import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/package_provider.dart';
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

class EditRulesOfSalon extends ConsumerWidget {
  EditRulesOfSalon({Key? key}) : super(key: key);




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


                             ListView.builder(
                                 itemCount: controller.rules.length,
                                 physics: NeverScrollableScrollPhysics(),
                                 shrinkWrap: true,
                                 itemBuilder: (context,i){
                                   return   Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: InkWell(
                                       onTap:(){
                                         controller.chooseRule(i);
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
                                                 height: height*0.06,
                                                 width: width*0.55,
                                                 alignment: Alignment.centerLeft,
                                                 child: Text(controller.rules[i].title!.en!,
                                                   style: TextStyle(fontSize: height*0.02),),
                                               ),
                                             ),
                                             Switch(
                                               value: controller.rules[i].chosen!,
                                               onChanged: (value) {
                                                 controller.chooseRule(i);
                                               },
                                               activeTrackColor: Constants.mainColor2,
                                               activeColor: Colors.white,
                                             ),

                                           ],
                                         ),
                                       ),
                                     ),
                                   );

                             }),


                              SizedBox(height: 50,),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      controller.storeRules(context);

                                       // Navigator.push(context, MaterialPageRoute(builder: (_)=>GoodJob()));
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

