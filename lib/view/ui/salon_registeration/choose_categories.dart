import 'package:beauty_center/constants.dart';
import 'package:beauty_center/models/another_category_model.dart';
import 'package:beauty_center/view/widgets/another_category.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/center_registration_provider2.dart';

import '../../widgets/add_works_picture.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/default_text_field.dart';
import '../../widgets/horizontal_progress.dart';
import '../../widgets/time_picker_theme.dart';
import '../../widgets/vertical_progress.dart';

class ChooseCategories extends ConsumerWidget {
  const ChooseCategories({Key? key}) : super(key: key);

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
            title: 'Salon Services',
          ),
          HorizontalProgress(index: 4,),
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
                                     Padding(
                                       padding: const EdgeInsets.only(left: 30,bottom: 10),
                                       child: Container(
                                         width: width*0.8,
                                         height: height*0.06,
                                         decoration: BoxDecoration(
                                           color: Constants.mainColor2,
                                           borderRadius: BorderRadius.circular(10),
                                           border: Border.all(color: Constants.mainColor2)
                                         ),
                                         child:  Center(
                                           child: Text(
                                             controller.categories[i].title!.en!,
                                             style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: height * 0.025,
                                               color: Colors.white
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),

                                      ListView.builder(
                                          itemCount: controller
                                              .categories[i].services!.length,
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, j) {
                                            return Column(

                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(left: 20),
                                                      child: Checkbox(
                                                          value: controller.categories[i]
                                                              .services![j].choose,
                                                          activeColor:
                                                          Constants.mainColor2,
                                                          onChanged: (value) {
                                                            controller.chooseCategory(value!, i, j);
                                                          }),
                                                    ),
                                                    Text(controller
                                                        .categories[i].services![j].title!.en!,style: TextStyle(
                                                        fontSize: height*0.02
                                                    ),),




                                                  ],
                                                ),
                                                Visibility(
                                                  visible: controller.categories[i].services![j].choose!,
                                                  child:Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,

                                                    children: [
                                                      SizedBox(width: width*0.15,),
                                                      Text('Price       ',style: TextStyle(
                                                        fontSize: height*0.02,


                                                      ),),
                                                      SizedBox(width: 20,),
                                                      Container(
                                                        width: width*0.15,
                                                        height: height*0.04,

                                                        decoration: BoxDecoration(
                                                          color:  Colors.white,
                                                          borderRadius: BorderRadius.circular(10),

                                                        ),
                                                        child: TextFormField(
                                                          cursorColor: Constants.mainColor2,
                                                          keyboardType: TextInputType.number,
                                                          initialValue: controller.categories[i].services![j].priceFrom.toString(),

                                                          decoration: const InputDecoration(
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
                                                            label: Text(
                                                              'From',style: TextStyle(
                                                                color: Constants.mainColor2
                                                            ),
                                                            ),
                                                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                          ),
                                                          onChanged: (value){
                                                            controller.setPrice(true,value, i , j);

                                                          },

                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Container(
                                                        width: width*0.15,
                                                        height: height*0.04,

                                                        decoration: BoxDecoration(
                                                          color:  Colors.white,
                                                          borderRadius: BorderRadius.circular(10),

                                                        ),
                                                        child: TextFormField(
                                                          cursorColor: Constants.mainColor2,
                                                          initialValue: controller.categories[i].services![j].priceTo.toString(),
                                                          keyboardType: TextInputType.number,

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
                                                            label: Text(
                                                              'To',style: TextStyle(
                                                                color: Constants.mainColor2
                                                            ),
                                                            ),
                                                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                          ),
                                                          onChanged: (value){
                                                            controller.setPrice(false,value, i , j);
                                                          },

                                                        ),
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Text('EGP',style: TextStyle(fontSize: 10),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20,),
                                                Visibility(
                                                  visible: controller.categories[i].services![j].choose!,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(width: width*0.15,),
                                                      Text('Duration',style: TextStyle(
                                                        fontSize: height*0.02,


                                                      ),),
                                                      SizedBox(width: 20,),
                                                      InkWell(
                                                        onTap: (){
                                                          controller.setDuration(true, i, j);
                                                        },
                                                        child: Container(
                                                          height: height*0.035,
                                                          width: width*0.09,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(10),
                                                              border: Border.all()
                                                          ),
                                                          child: Center(
                                                            child: Icon(Icons.add,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Container(
                                                        width: width*0.22,
                                                        height: 35,

                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                          borderRadius: BorderRadius.circular(10),
                                                          border: Border.all(color: Colors.black38)
                                                        ),

                                                        child: Center(
                                                            child: Text(
                                                                '${controller.categories[i].services![j].duration} Minute'
                                                            )),
                                                      ),

                                                      SizedBox(width: 10,),
                                                      InkWell(
                                                        onTap: (){
                                                          controller.setDuration(false, i, j);
                                                        },
                                                        child: Container(
                                                          height: height*0.035,
                                                          width: width*0.09,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(10),
                                                              border: Border.all()
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(bottom: 20),
                                                            child: Icon(Icons.minimize,
                                                            ),
                                                          ),
                                                        ),
                                                      ),


                                                    ],
                                                  ),
                                                ),
                                                Visibility(
                                                    visible: controller.categories[i].services![j].choose!,
                                                    child: SizedBox(height: 20,)),
                                                Visibility(
                                                    visible: controller.categories[i].services![j].choose!,
                                                    child: Divider())
                                              ],
                                            );
                                          }),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }),

                        //   Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        //     child: Text('Add another Service ?',
                        //     style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                        //   ),
                        // ListView.builder(
                        //     itemCount: controller.anotherCategoriesLength,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     itemBuilder: (context,i){
                        //   return AnotherCategory(anotherCategories: controller.anotherCategories,
                        //   onChanged: (String category,String name){
                        //     controller.chosenAnotherCategories.insert(i, AnotherCategoryModel(
                        //         name: name,
                        //         category: category
                        //     )) ;
                        //     print(name);
                        //     },
                        // );
                        // }),


                          SizedBox(height: 50,),


                          Row(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  controller.storeServices(context);

                                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoriesSpecification()));
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
                    progressHeight: height / 2,
                    index: 4,
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
