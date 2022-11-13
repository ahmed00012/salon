

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/center_registration_provider1.dart';



class ChooseLogoDialog extends ConsumerWidget {
  const ChooseLogoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
              controller.pickImage(false);
            },
            child: Container(
              height: height*0.05,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5,),
                    Text('Pick Photo'),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){
              Navigator.pop(context);
              showDialog(context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: height*0.3,
                            width: width,
                            child: GridView.builder(
                                itemCount: 4,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.2
                                ),
                                itemBuilder: (context,i){
                                  return  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: (){
                                        controller.pickImage(true,index:i );
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: height*0.1,
                                        width: height*0.1,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 2),
                                            shape: BoxShape.circle
                                        ),
                                        child: Center(
                                          child: Image.asset(controller.recommendedPics[i],
                                            height: height*0.07,),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              height: height*0.05,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image),
                    SizedBox(width: 5,),
                    Text('Recommended'),
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
