import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/auth_provider.dart';
import 'package:beauty_center/view/ui/forgot_password.dart';
import 'package:beauty_center/view/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
   LoginScreen({Key? key,this.gender}) : super(key: key);

   int? gender;

  double animatedHeight = 600;

  Widget widget = Container();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final controller = ref.watch(authFuture(height));
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(gender==1?'assets/images/woman-hairdresser-salon.jpg':
            'assets/images/handsome-man-barbershop-shaving-beard.jpg'),
            fit: BoxFit.cover,
          )),

      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),

        body: SingleChildScrollView(
          child: Column(
            children: [

              StatefulBuilder(

                  builder: (context,setState){


                    Future.delayed(Duration(seconds: 1),(){
                      setState((){
                        animatedHeight = height*0.1;
                      });
                    });

                    Future.delayed(Duration(microseconds: 100),(){
                      setState((){
                        widget =  Padding(
                          padding:  EdgeInsets.only(top: height*0.1),
                          child: Image.asset('assets/images/FullLogo-removebg-preview.png',

                            width: width*0.8,),
                        );
                      });
                    });

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedContainer(

                          width: width,
                          height: animatedHeight,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        ),
                        widget,


                      ],
                    );
                  }),


              SizedBox(height: height*0.1,),

              Container(

                width: width*0.8,
                decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: FocusScope(
                  child: Focus(
                    onFocusChange: (focus) => controller.switchFocus(focus,'phoneLoginFocus'),
                    child: TextFormField(
                      cursorColor: Constants.mainColor2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                width: 1, color: Constants.mainColor2),
                          ),
                          hintText: 'PHONE',
                          hintStyle: TextStyle(color:controller.phoneLoginFocus?
                          Constants.mainColor2:Colors.black26,
                              fontWeight: FontWeight.bold,fontSize: 14),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.phone,
                                color: Constants.mainColor2),
                          )
                      ),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                width: width*0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: FocusScope(
                  child: Focus(
                    onFocusChange: (focus) => controller.switchFocus(focus,'passwordLoginFocus'),
                    child: TextFormField(
                      cursorColor: Constants.mainColor2,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 1, color: Constants.mainColor2),
                        ),
                        hintText: 'PASSWORD',
                        hintStyle: TextStyle(color:controller.passwordLoginFocus?
                        Constants.mainColor2:Colors.black26,

                            fontWeight: FontWeight.bold,fontSize: 14),
                        prefixIcon: Icon(Icons.security,
                            color: Constants.mainColor2),
                      ),

                    ),
                  ),
                ),
              ),

              SizedBox(height: 35,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPasswordScreen()));
                },
                child: Text('Forgot Password ?',
                  style: TextStyle(
                      fontSize: height*0.018,
                      color: Constants.mainColor2,
                      fontWeight: FontWeight.w500
                  ),),
              ),
              SizedBox(height: 35,),
              AnimatedContainer(
                height:controller.animatedHeight2,
                width: width*0.5,
                duration: Duration(seconds: 1),
                curve: Curves.bounceInOut,
                decoration: BoxDecoration(
                    color: Constants.mainColor2,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,

                        fontSize: height*0.02
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen(gender: gender,)));
                },
                child: Text('Create New Account',
                  style: TextStyle(
                      fontSize: height*0.018,
                      color: Constants.mainColor2,

                      fontWeight: FontWeight.w500
                  ),),
              ),

              SizedBox(height: height*0.1,)

            ],
          ),
        ),
      ),
    );
  }
}
