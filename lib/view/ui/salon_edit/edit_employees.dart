import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/ui/salon_edit/edit_packages.dart';
import 'package:beauty_center/view/ui/salon_registeration/packages.dart';
import 'package:beauty_center/view/widgets/employee_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/edit_employees_provider.dart';
import '../../../provider/employee_provider.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/vertical_progress.dart';

class EmployeesEdit extends ConsumerWidget {
  EmployeesEdit({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(editEmployeeFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            title: 'Employees',
          ),

          Expanded(
            child: StatefulBuilder(builder: (context, setState) {
              return ListView(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.employees.length,
                      itemBuilder: (context,i){
                        return Container(
                          color: Colors.black38,
                        );
                      }),
                  SizedBox(height: 40,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*0.25),
                    child: InkWell(
                      onTap: (){


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
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*0.2),
                    child: InkWell(
                      onTap: (){

                        // if(!controller.employees.last.stored!)
                        //   controller.storeEmployee(controller.employees.last).then((value) {
                        //     Navigator.pop(context);
                        //   });
                        // else
                        //   Navigator.pop(context);

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
                  SizedBox(height: 40,),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

