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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(

                  children: [
                     GridView.builder(

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shrinkWrap: true,
                        itemCount: controller.employees.length,
                        itemBuilder: (context,i){
                          return Container(

                            decoration: BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio: 1.35,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      child: Image.network(controller.employees[i].image!,
                                      fit: BoxFit.fill,),
                                    )),
                                SizedBox(height: 5,),
                                Text(controller.employees[i].name!,
                                style: TextStyle(
                                  fontSize: height*0.02,

                                ),)
                              ],
                            ),
                          );
                        }),

                    Align(
                      alignment: Alignment.bottomRight,
                       child: Padding(
                         padding: const EdgeInsets.only(right: 30,bottom: 30),
                         child: InkWell(
                          onTap: (){


                          },
                          child: Container(
                            height: height*0.07,
                            width: height*0.07,
                            decoration: BoxDecoration(
                                color: Constants.mainColor2,
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child:Icon(Icons.add,color: Colors.white,)
                            ),
                          ),
                      ),
                       ),
                    ),

                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

