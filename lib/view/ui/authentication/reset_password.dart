


import 'package:beauty_center/view/ui/authentication/login_screen.dart';
import 'package:beauty_center/view/ui/authentication/otp.dart';
import 'package:beauty_center/view/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

import '../../../constants.dart';
import '../../../provider./auth_provider.dart';

class ResetPassword extends ConsumerWidget {
   ResetPassword({Key? key,this.gender}) : super(key: key);
  int? gender;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final controller = ref.watch(authFuture);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(gender == 1
                ? 'assets/images/beauty-portrait-ginger-woman-with-long-hair-posing-with-green-leaf.jpg'
                : 'assets/images/handsome-man-barbershop-shaving-beard.jpg'),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        body: FooterLayout(
          footer: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: width,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )),
                child: Column(
                  children: [
                    SizedBox(height: 25,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [

                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios,size: 30,)),
                          SizedBox(width: 40,),


                          Text(
                            'Reset Password',
                            style: TextStyle(
                                fontSize: height*0.022
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 50,),

                    DefaultTextField(label: 'Password',icon: Icons.security),
                    SizedBox(height: 25,),
                    DefaultTextField(label: 'Retype Password',icon: Icons.security),

                    SizedBox(height: 70,),

                    InkWell(
                      onTap: (){

                      int  count = 0;
                        Navigator.popUntil(context, (route) {
                          return count++ == 3;
                        });

                      },
                      child: Container(
                        height:height*0.07,
                        width: width*0.5,

                        decoration: BoxDecoration(
                            color: Constants.mainColor2,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            'DONE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height*0.02
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),

                  ],
                ),
              ),
            ),
          ),
          child:  Center(
            child: Image.asset(
              'assets/images/FullLogo-removebg-preview.png',
              width: width * 0.8,

            ),
          ),
        ),

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //
        //       StatefulBuilder(
        //
        //           builder: (context,setState){
        //
        //
        //             Future.delayed(Duration(seconds: 1),(){
        //               setState((){
        //                 animatedHeight = height*0.1;
        //               });
        //             });
        //
        //             Future.delayed(Duration(microseconds: 100),(){
        //               setState((){
        //                 widget =  Padding(
        //                   padding:  EdgeInsets.only(top: height*0.1),
        //                   child: Image.asset('assets/images/FullLogo-removebg-preview.png',
        //
        //                     width: width*0.8,),
        //                 );
        //               });
        //             });
        //
        //             return Stack(
        //               alignment: Alignment.center,
        //               children: [
        //                 AnimatedContainer(
        //
        //                   width: width,
        //                   height: animatedHeight,
        //                   duration: const Duration(seconds: 1),
        //                   curve: Curves.easeInOut,
        //                 ),
        //                 widget,
        //
        //
        //               ],
        //             );
        //           }),
        //
        //
        //       SizedBox(height: height*0.05,),
        //
        //
        //       KeyboardAttachable(
        //         transitionBuilder: _buildTransition,
        //
        //         child: Container(
        //              width: width,
        //              decoration: BoxDecoration(
        //                  color: Colors.white,
        //                  borderRadius: BorderRadius.only(
        //                    topRight: Radius.circular(40),
        //                    topLeft: Radius.circular(40),
        //                  )
        //              ),
        //              child: Column(
        //                children: [
        //                  SizedBox(height: height*0.05,),
        //
        //                  Container(
        //
        //                    width: width*0.8,
        //                    decoration: BoxDecoration(
        //                      color:  Colors.white,
        //                      borderRadius: BorderRadius.circular(10),
        //
        //                    ),
        //                    child: FocusScope(
        //                      child: Focus(
        //                        onFocusChange: (focus) => controller.switchFocus(focus,'phoneLoginFocus'),
        //                        child: TextFormField(
        //                          cursorColor: Constants.mainColor2,
        //                          decoration: InputDecoration(
        //                              border: OutlineInputBorder(
        //                                borderRadius:
        //                                BorderRadius.all(Radius.circular(8)),
        //                                borderSide: BorderSide(
        //                                    width: 1, color: Colors.black26),
        //                              ),
        //                              focusedBorder: OutlineInputBorder(
        //                                borderRadius:
        //                                BorderRadius.all(Radius.circular(8)),
        //                                borderSide: BorderSide(
        //                                    width: 1, color: Constants.mainColor2),
        //                              ),
        //                              labelText: 'Phone',
        //                              labelStyle: TextStyle(color:controller.phoneLoginFocus?
        //                              Constants.mainColor2:Colors.black26,
        //                                  fontWeight: FontWeight.bold,fontSize: 14),
        //                              prefixIcon: Padding(
        //                                padding: const EdgeInsets.only(right: 10),
        //                                child: Icon(Icons.phone,
        //                                    color: Constants.mainColor2),
        //                              )
        //                          ),
        //
        //                        ),
        //                      ),
        //                    ),
        //                  ),
        //                  SizedBox(height: 25,),
        //                  Container(
        //                    width: width*0.8,
        //                    decoration: BoxDecoration(
        //                      color: Colors.white,
        //                      borderRadius: BorderRadius.circular(10),
        //
        //                    ),
        //                    child: FocusScope(
        //                      child: Focus(
        //                        onFocusChange: (focus) => controller.switchFocus(focus,'passwordLoginFocus'),
        //                        child: TextFormField(
        //                          cursorColor: Constants.mainColor2,
        //                          decoration: InputDecoration(
        //                            border: OutlineInputBorder(
        //                                borderRadius:
        //                                BorderRadius.all(Radius.circular(8)),
        //                                borderSide: BorderSide(
        //                                    width: 1, color: Colors.black26)),
        //                            focusedBorder: OutlineInputBorder(
        //                              borderRadius:
        //                              BorderRadius.all(Radius.circular(8)),
        //                              borderSide: BorderSide(
        //                                  width: 1, color: Constants.mainColor2),
        //                            ),
        //                            labelText: 'Password',
        //                            labelStyle: TextStyle(color:controller.passwordLoginFocus?
        //                            Constants.mainColor2:Colors.black26,
        //
        //                                fontWeight: FontWeight.bold,fontSize: 14),
        //                            prefixIcon: Icon(Icons.security,
        //                                color: Constants.mainColor2),
        //                          ),
        //
        //                        ),
        //                      ),
        //                    ),
        //                  ),
        //
        //                  SizedBox(height: 35,),
        //                  InkWell(
        //                    onTap: (){
        //                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPasswordScreen()));
        //                    },
        //                    child: Text('Forgot Password ?',
        //                      style: TextStyle(
        //                          fontSize: height*0.018,
        //                          color: Constants.mainColor2,
        //                          fontWeight: FontWeight.w500
        //                      ),),
        //                  ),
        //                  SizedBox(height: 35,),
        //                  InkWell(
        //                    onTap: (){
        //                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CenterInfo()));
        //                    },
        //                    child: AnimatedContainer(
        //                      height:controller.animatedHeight2,
        //                      width: width*0.5,
        //                      duration: Duration(seconds: 1),
        //                      curve: Curves.bounceInOut,
        //                      decoration: BoxDecoration(
        //                          color: Constants.mainColor2,
        //                          borderRadius: BorderRadius.circular(20)
        //                      ),
        //                      child: Center(
        //                        child: Text(
        //                          'LOGIN',
        //                          style: TextStyle(
        //                              color: Colors.white,
        //
        //                              fontSize: height*0.02
        //                          ),
        //                        ),
        //                      ),
        //                    ),
        //                  ),
        //                  SizedBox(height: 35,),
        //                  InkWell(
        //                    onTap: (){
        //                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen(gender: gender,)));
        //                    },
        //                    child: Text('Create New Account',
        //                      style: TextStyle(
        //                          fontSize: height*0.018,
        //                          color: Constants.mainColor2,
        //
        //                          fontWeight: FontWeight.w500
        //                      ),),
        //                  ),
        //
        //                  SizedBox(height: height*0.1,)
        //                ],
        //              ),
        //            ),
        //       ),
        //
        //
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
