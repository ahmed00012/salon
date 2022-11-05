

import 'package:animate_do/animate_do.dart';
import 'package:beauty_center/local_storage.dart';
import 'package:flutter/material.dart';

import '../../../provider./auth_provider.dart';
import '../../widgets/default_button.dart';

import 'intro.dart';

class ChooseTypeScreen extends StatelessWidget {
  const ChooseTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
     // backgroundColor: AppTheme.primary,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/girl4.jpg",),
              fit: BoxFit.cover
          ),),
        // decoration: BoxDecoration(
        //     gradient:  LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.centerLeft,
        //       colors: [
        //         //sColors.yellow,
        //         Color(0xffFDC830),
        //         AppTheme.primary,
        //
        //       ],
        //     )
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .2,
              ),
             //  FadeInUp(
             //    from: 200,
             //    delay: Duration(microseconds: 3000),
             // //   duration: Duration(microseconds: 3000),
             //    child: Center(child: ClipRRect(
             //      //borderRadius: BorderRadius.circular(15),
             //        child: Image.asset("assets/images/logo3.png",height: size.height * .25,))),
             //  ),
            //  Spacer(),
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
                        LocalStorage.saveData(key: 'gender', value: 'men');



                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => OnboardingScreen(gender: 2,)));
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
                        LocalStorage.saveData(key: 'gender', value: 'women');
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => OnboardingScreen(gender: 1,)));
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
      ),
    );
  }
}
