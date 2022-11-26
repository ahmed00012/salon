

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../provider/reports_provider.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final controller = ref.watch(reportsFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        SizedBox(height: 10,),
        // Row(
        //   children: [
        //     SizedBox(width: 20,),
        //     Icon(Icons.arrow_back_ios,size: 30,),
        //     SizedBox(width: 10,),
        //     Text('Reports',style: TextStyle(
        //         fontSize: height*0.03,
        //         fontWeight: FontWeight.bold
        //     ),),
        //   ],
        // ),

        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'Reports',
            style: TextStyle(
                fontSize: height * 0.035, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: (){
                  controller.setDate(DateTime(controller.dateTime.year,controller.dateTime.month,controller.dateTime.day-1));
                },
                child: Icon(Icons.arrow_back_ios,size: 30,)),
            InkWell(
              onTap: (){
                showDatePicker(context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year, 1, 1),
                  lastDate: DateTime(DateTime.now().year+5, 12, 31),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Constants.mainColor2,
                        ),
                      ),
                      child: child!,
                    );
                  },
                ).then((value) {
                  if(value!=null){
                    controller.setDate(value);
                  }
                });
              },
              child: Text(controller.date,
                style: TextStyle(
                    fontSize: height * 0.035, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
                onTap: (){
                  controller.setDate(DateTime(controller.dateTime.year,controller.dateTime.month,controller.dateTime.day-1));
                },
                child: Icon(Icons.arrow_forward_ios,size: 30,)),
          ],
        ),

        SizedBox(height: 40,),

        GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.reports.length,
            itemBuilder: (context,i){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Constants.mainColor2
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.reports[i].key!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: height*0.025,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Text(controller.reports[i].value!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height*0.02,

                    ),),
                ],
              ),
            ),
          );

            })
      ],
    );
  }
}
