import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/ui/salon_registeration/employees_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/center_registration_provider2.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/vertical_progress.dart';

class CategoriesSpecification extends ConsumerWidget {
   CategoriesSpecification({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(registerFuture2);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            title: 'Salon Information',
          ),
          HorizontalProgress(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StatefulBuilder(builder: (context, setState) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [

                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.categories.length,

                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20,),

                                        Text(
                                          controller.categories[i].name!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: height * 0.022,
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    ListView.builder(
                                        itemCount: controller
                                            .categories[i].subcategory!.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, j) {
                                          return Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(left: 15),
                                                child: Checkbox(
                                                    value: true,
                                                    activeColor:
                                                    Constants.mainColor2,
                                                    onChanged: (value) {}),
                                              ),
                                              Container(
                                                width: width*0.2,
                                                child: Text(controller.categories[i]
                                                    .subcategory![j].name!,style: TextStyle(
                                                    fontSize: height*0.018
                                                ),),
                                              ),
                                              Spacer(),

                                              InkWell(onTap: (){
                                                controller.markHomeSalon(i, j,inHome: !controller.categories[i].subcategory![j].inHome!);
                                              },
                                                child: Column(
                                                  children: [
                                                    Text('Home'),
                                                    Icon(Icons.home,color:
                                                    controller.categories[i].subcategory![j].inHome!?
                                                    Constants.mainColor2:Colors.black12)
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                              InkWell(
                                                onTap: (){
                                                  controller.markHomeSalon(i, j,inSalon: !controller.categories[i].subcategory![j].inSalon!);
                                                },
                                                child: Column(
                                                  children: [
                                                    Text('Salon'),
                                                    Icon(Icons.chair,
                                                      color: controller.categories[i].subcategory![j].inSalon!?
                                                      Constants.mainColor2:Colors.black12
                                                      ,)
                                                  ],
                                                ),
                                              ),

                                              Spacer(),
                                              Container(
                                                width: width*0.15,
                                                height: 35,
                                                color: Colors.white,

                                                child: TextFormField(
                                                  cursorColor: Constants.mainColor2,
                                                  textAlign: TextAlign.center,

                                                  initialValue: '15',
                                                  maxLength: 3,

                                                  decoration:const InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(8)),
                                                      borderSide: BorderSide(
                                                          width: 1, color: Constants.mainColor2),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(8)),
                                                      borderSide: BorderSide(
                                                          width: 1, color: Constants.mainColor2),
                                                    ),
                                                    labelText: 'Duration',
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                                                    labelStyle: TextStyle(color: Constants.mainColor2,
                                                        fontWeight: FontWeight.bold,fontSize: 12),
                                                    counterText: "",

                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 14
                                                  ),
                                                  onChanged: (value){

                                                  },


                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text('Min',style: TextStyle(
                                                fontSize: 14
                                              ),)




                                            ],
                                          );
                                        }),
                                    SizedBox(
                                      height: 20,
                                    ),



                                  ],
                                );
                              }),
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              if(controller.haveEmployees)
                              controller.markHaveEmployees();
                            },
                            child: Row(
                              children: [
                                SizedBox(width: 20,),
                                Radio(value: false,
                                  activeColor: Constants.mainColor2,
                                  onChanged: (value){
                                    controller.markHaveEmployees();
                                  },
                                  groupValue: controller.haveEmployees,),
                                Text('I do services myself',style: TextStyle(
                                  fontSize: height*0.02
                                ),)
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              if(!controller.haveEmployees)
                                controller.markHaveEmployees();
                            },
                            child: Row(
                              children: [
                              SizedBox(width: 20,),
                                Radio(value: true,
                                    activeColor: Constants.mainColor2,
                                    onChanged: (value){
                                      controller.markHaveEmployees();
                                    },
                                  toggleable: true,
                                  groupValue: controller.haveEmployees,),
                                Text('I have employees',style: TextStyle(
                                    fontSize: height*0.02
                                ),)
                              ],
                            ),
                          ),


                          SizedBox(height: 50,),


                          Row(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>EmployeesRegister()));

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

