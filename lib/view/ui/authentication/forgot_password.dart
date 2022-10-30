


import 'package:beauty_center/view/ui/authentication/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';
import '../../../provider./auth_provider.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final controller = ref.watch(authFuture(height));
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
              child: Row(
                children: [

                   InkWell(
                       onTap: (){
                         Navigator.pop(context);
                       },
                       child: Icon(Icons.arrow_back_ios,size: 30,)),
                 SizedBox(width: 40,),


                 Text(
                      'Forgot Password',
                   style: TextStyle(
                     fontSize: height*0.022
                   ),
                    ),

                ],
              ),
            ),
            SizedBox(height: height*0.1,),
            Container(
              width: width*0.8,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),

              ),
              child: FocusScope(
                child: Focus(
                  onFocusChange: (focus) => controller.switchFocus(focus,'phoneForgotPasswordFocus'),
                  child: TextFormField(
                    cursorColor: Constants.mainColor2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 1, color: Constants.mainColor2),
                      ),

                      hintText: 'PHONE',
                      hintStyle: TextStyle(color:controller.phoneForgotPasswordFocus?
                      Constants.mainColor2:Colors.black45,

                          fontWeight: FontWeight.bold,fontSize: 14),
                      prefixIcon: Icon(Icons.phone,
                          color: controller.phoneForgotPasswordFocus?
                          Constants.mainColor2:Colors.black45),
                    ),

                  ),
                ),
              ),
            ),

            SizedBox(height: height*0.1,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>OTPScreen()));
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
                    'CONTINUE',
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
    );
  }
}
