import 'package:beauty_center/constants.dart';
import 'package:beauty_center/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final controller = ref.watch(authFuture);
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          child: Stack(
            children: [

              ListView.builder(
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context,i){
                    return   Image.asset('assets/images/61776-OA5CQN-776.jpg',fit: BoxFit.cover,
                      height: height*0.2,
                      width: width,

                    );

              }),

              Container(
                height: height,
                width: width,
                color: Colors.white.withOpacity(0.8),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    SizedBox(height: height*0.1,),
                   Image.asset('assets/images/Black_and_White_Minimalist_Illustration_Company_Logo-removebg-preview.png',
                   color: Color(0xffce6a85),

                   width: width*0.8,),

                    Container(

                      width: width*0.8,
                      decoration: BoxDecoration(
                        color:
                        controller.phoneLoginFocus?
                        Constants.mainColor2.withOpacity(0.2):
                        Colors.grey.withOpacity(0.2),
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
                        color:
                        controller.passwordLoginFocus?
                        Constants.mainColor2.withOpacity(0.2):
                        Colors.grey.withOpacity(0.2),
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
                    
                    SizedBox(height: 25,),
                    Text('Forgot Password ?',
                      style: TextStyle(
                          fontSize: height*0.018,
                          color: Constants.mainColor2,
                          fontWeight: FontWeight.w500
                      ),),
                    SizedBox(height: 25,),
                    Container(
                      height: height*0.07,
                      width: width*0.5,
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
                  Text('Create New Account',
                  style: TextStyle(
                    fontSize: height*0.018,
                    color: Constants.mainColor2,
                    fontWeight: FontWeight.w500
                  ),),

                  ],
                ),
              )

            ],
          )
      ),
    );
  }
}
