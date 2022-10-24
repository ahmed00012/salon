import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/auth_provider.dart';
import 'package:beauty_center/view/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  double? animatedWidth = 0.0;
  String login = '';
  String signup = '';



  @override
  void initState() {

    Future.delayed(Duration(seconds: 1),(){ setState(() {
      animatedWidth = MediaQuery.of(context).size.width*0.8;
      login = 'LOGIN';
      signup = 'SIGNUP';
    });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          height: height,
          width: width,
          child: Stack(
            children: [

              Image.asset('assets/images/handsome-man-barbershop-shaving-beard.jpg',fit: BoxFit.cover,
                height: height,
                width: width,

              ),

              Container(
                height: height,
                width: width,
                color: Colors.black.withOpacity(0.5),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(height: height*0.2,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                      },
                      child: AnimatedContainer(
                        // Use the properties stored in the State class.
                        width: animatedWidth,
                        height: height*0.075,
                        decoration: BoxDecoration(
                          color: Color(0xffED9121) ,
                          borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                            BoxShadow(
                            offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),],

                        ),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        child: Center(
                          child: Text(
                            login,
                            style: TextStyle(
                                color: Colors.white,
                              fontSize: height*0.02,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    AnimatedContainer(
                      // Use the properties stored in the State class.
                      width: animatedWidth,
                      height: height*0.075,
                      decoration: BoxDecoration(
                        color: Constants.mainColor2,
                          borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.3),
                          ),],

                      ),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: Center(
                        child: Text(
                          signup,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height*0.02,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          )
      ),
    );
  }
}


