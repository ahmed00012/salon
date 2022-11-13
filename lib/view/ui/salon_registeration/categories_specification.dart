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

class CategoriesSpecification extends ConsumerWidget {
  const CategoriesSpecification({Key? key}) : super(key: key);

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
                                            fontSize: height * 0.02,
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
                                                const EdgeInsets.only(left: 20),
                                                child: Checkbox(
                                                    value: true,
                                                    activeColor:
                                                    Constants.mainColor2,
                                                    onChanged: (value) {}),
                                              ),
                                              Text(controller.categories[i]
                                                  .subcategory![j].name!,style: TextStyle(
                                                  fontSize: height*0.02
                                              ),),
                                              Spacer(),





                                            ],
                                          );
                                        }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              }),



                          SizedBox(height: 50,),


                          Row(
                            children: [
                              Spacer(),
                              InkWell(
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
                    index: 3,
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
