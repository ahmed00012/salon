import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/auth_provider.dart';
import 'package:beauty_center/view/ui/authentication/forgot_password.dart';
import 'package:beauty_center/view/ui/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

import '../../widgets/default_text_field.dart';
import '../salon_registeration/center_info.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key, this.gender}) : super(key: key);

  int? gender;

  double animatedHeight = 0;
  double animatedHeightContainer = 0;

  Widget widget = Container();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final controller = ref.watch(authFuture);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(controller.getGender() == 'woman'
            ? 'assets/images/beauty-portrait-ginger-woman-with-long-hair-posing-with-green-leaf.jpg'
            : 'assets/images/handsome-man-barbershop-shaving-beard.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        body: StatefulBuilder(
          builder: (context,setState) {
            Future.delayed(Duration(milliseconds: 300), () {
              setState(() {
                animatedHeight = height * 0.05;
                animatedHeightContainer = height * 0.65;
              });
            });

            Future.delayed(Duration(seconds: 1), () {
              setState(() {
                widget = Image.asset(
                  'assets/images/FullLogo-removebg-preview.png',
                  height: height*0.3,
                );
              });
            });
            return FooterLayout(
              footer: SingleChildScrollView(
                child:  AnimatedContainer(
                  width: width,
                  height: animatedHeightContainer,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      )),
                  duration: Duration(seconds: 1),
                  curve:Curves.easeIn,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: width,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      DefaultTextField(
                          controller: controller.phoneController,
                          label: 'Phone',
                          validator: (value){
                            if(value!.length<6){
                              return 'wrong phone';
                            }
                            if(value.isEmpty){
                              return 'Field Required';
                            }
                          },

                          icon: Icons.phone,number: true),
                      SizedBox(
                        height: 25,
                      ),
                      DefaultTextField(
                          controller: controller.passwordController,
                          password: true,
                          validator: (value){
                            if(value!.length<6){
                              return 'wrong password';
                            }
                            if(value.isEmpty){
                              return 'Field Required';
                            }
                          },
                          label: 'Password',
                          icon: Icons.security),
                      SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ForgotPasswordScreen()));
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              fontSize: height * 0.018,
                              color: Constants.mainColor2,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => CenterInfo()));
                          controller.login(context);
                        },
                        child: Container(
                          height: height*0.07,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                              color: Constants.mainColor2,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white, fontSize: height * 0.02),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CenterInfo()));
                        },
                        child: Text(
                          'Create New Account',
                          style: TextStyle(
                              fontSize: height * 0.018,
                              color: Constants.mainColor2,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              child: Column(
                children: [
                  AnimatedContainer(
                    width: width,
                    height: animatedHeight,
                    duration: const Duration(seconds: 2),
                    curve:  Curves.easeIn,
                  ),
                  widget,
                ],
              )
            );
          }
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
