import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({Key? key}) : super(key: key);

  double animatedHeight = 600;

  Widget widget = Container();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final controller = ref.watch(authFuture(height));
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                color: Colors.black.withOpacity(0.8),
              ),

              SingleChildScrollView(
                child: Column(

                  children: [

                    SizedBox(height: height*0.1,),
                    Image.asset('assets/images/Black_and_White_Minimalist'
                        '_Illustration_Company_Logo-removebg-preview.png',
                      color: Color(0xffce6a85),
                      width: width*0.8,),
                    Container(
                      width: width*0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) => controller.switchFocus(focus,'nameSignupFocus'),
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
                              hintText: 'Name',
                              hintStyle: TextStyle(color:controller.nameSignupFocus?
                              Constants.mainColor2:Colors.black26,
                                  fontWeight: FontWeight.bold,fontSize: 14),
                              prefixIcon: Icon(Icons.person,
                                  color: Constants.mainColor2),
                            ),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(

                      width: width*0.8,
                      decoration: BoxDecoration(
                        color:  Colors.white,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) => controller.switchFocus(focus,'phoneSignupFocus'),
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
                                hintStyle: TextStyle(color:controller.phoneSignupFocus?
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
                          onFocusChange: (focus) => controller.switchFocus(focus,'passwordSignupFocus'),
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
                              hintStyle: TextStyle(color:controller.passwordSignupFocus?
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
                    Container(
                      height:height*0.07,
                      width: width*0.5,
                      decoration: BoxDecoration(
                          color: Constants.mainColor2,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text(
                          'SIGNUP',
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
                        Navigator.pop(context);
                      },
                      child: Text('Already Have Account ?',
                        style: TextStyle(
                            fontSize: height*0.018,
                            color: Constants.mainColor2,
                            fontWeight: FontWeight.w500
                        ),),
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
