

import 'package:animate_do/animate_do.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider./auth_provider.dart';
import '../../provider/intro_provider.dart';
import '../widgets/default_button.dart';

import 'intro.dart';

class ChooseTypeScreen extends StatelessWidget {
  const ChooseTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
     // backgroundColor: AppTheme.primary,
      body: Consumer(
        builder: (context,ref,child) {
          final controller = ref.watch(introFuture);
          return
            controller.onBoardingContent.image!=null?
            Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(controller.onBoardingContent.image!),
                  fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .2,
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 3000),
                    from: 200,

                    child: Text(
                      "Make your \nmain choice as",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                         // height: size.height*.0015,
                          fontSize: size.height * .045),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  FadeInUp(
                    delay: Duration(microseconds: 1000),
                    from: 200,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DefaultButton(
                          font: size.height * .025,
                          radius: 7,
                          title: "Men",
                          color: Colors.white,
                          textColor: Colors.black,
                          width: size.width * .35,
                          function: (){
                            controller.identifyGender(1);



                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
                          },
                        ),
                        DefaultButton(
                          font: size.height * .025,
                          radius: 7,
                          title: "Women",
                          textColor: Colors.white,
                          color: Colors.transparent,
                          width: size.width * .35,
                          borderColor: Colors.white,
                          function: (){
                            controller.identifyGender(2);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => OnboardingScreen()));
                          //  push(context, OnboardPage());
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                ],
              ),
            ),
          ):Container();
        }
      ),
    );
  }
}
