import 'package:beauty_center/constants.dart';
import 'package:beauty_center/models/another_category_model.dart';
import 'package:beauty_center/view/ui/salon_registeration/categories_specification.dart';
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
                                          SizedBox(width: 10,),
                                          Checkbox(
                                              value: controller.categories[i].choose,
                                              activeColor: Constants.mainColor2,
                                              onChanged: (value) {
                                                controller.chooseCategory(
                                                    false, value!, i);
                                              }),
                                          Text(
                                            controller.categories[i].name!,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.02,
                                            ),
                                          ),
                                        ],
                                      ),
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
                                                  const EdgeInsets.only(left: 30),
                                                  child: Checkbox(
                                                      value: controller.categories[i]
                                                          .subcategory![j].choose,
                                                      activeColor:
                                                      Constants.mainColor2,
                                                      onChanged: (value) {
                                                        controller.chooseCategory(
                                                            true, value!, i,
                                                            j: j);
                                                      }),
                                                ),
                                                Text(controller.categories[i]
                                                    .subcategory![j].name!,style: TextStyle(
                                                    fontSize: height*0.02
                                                ),),
                                                Spacer(),

                                                Visibility(
                                                  visible: controller.categories[i].subcategory![j].choose!,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    child: Container(
                                                      width: width*0.2,
                                                      height: height*0.05,

                                                      decoration: BoxDecoration(
                                                        color:  Colors.white,
                                                        borderRadius: BorderRadius.circular(10),

                                                      ),
                                                      child: TextFormField(
                                                        cursorColor: Constants.mainColor2,
                                                        initialValue: '00.00',

                                                        decoration: InputDecoration(
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
                                                            'Price',style: TextStyle(
                                                            color: Constants.mainColor2
                                                          ),
                                                          ),
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                        ),
                                                        onChanged: (value){

                                                        },

                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                    visible: controller.categories[i].subcategory![j].choose!,
                                                    child: Text('EGP'))

                                              ],
                                            );
                                          }),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                            child: Text('Add another category ?',
                            style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.bold),),
                          ),
                        ListView.builder(
                            itemCount: controller.anotherCategoriesLength,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context,i){
                          return AnotherCategory(anotherCategories: controller.anotherCategories,
                          onChanged: (String category,String name){
                            controller.chosenAnotherCategories.insert(i, AnotherCategoryModel(
                                name: name,
                                category: category
                            )) ;
                            print(name);
                            },
                        );
                        }),


                          SizedBox(height: 50,),


                          Row(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: (){

                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoriesSpecification()));
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
