import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/ui/salon_registeration/packages.dart';
import 'package:beauty_center/view/ui/salon_registeration/rules_of_salon.dart';
import 'package:beauty_center/view/widgets/default_text_field.dart';
import 'package:beauty_center/view/widgets/employee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/center_registration_provider2.dart';
import '../../../provider/center_registration_provider3.dart';
import '../../widgets/add_works_picture.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';

class EmployeesRegister extends ConsumerWidget {
  EmployeesRegister({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(registerFuture3);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final localizations = MaterialLocalizations.of(context);


    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            title: 'Employees',
          ),
          HorizontalProgress(index: 6,),
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
                                itemCount: controller.employees.length,
                                itemBuilder: (context,i){
                                  return EmployeeWidget(i: i,);
                                }),
                            SizedBox(height: 40,),
                              InkWell(
                                onTap: (){
                                  controller.setEmployee(controller.employees.length);
                                },
                                child: Container(
                                  height: height*0.065,
                                  decoration: BoxDecoration(
                                      color: Constants.mainColor2,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Center(
                                    child: Text('Add Another Employee',style: TextStyle(color: Colors.white,
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
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Packages()));

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
                              SizedBox(height: 40,),
                          ],
                        )
                      )

                  ),



                  VerticalProgress(
                    height: height,
                    progressHeight: height / 5,
                    index: 5,
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

