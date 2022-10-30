


import 'package:beauty_center/view/ui/authentication/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants.dart';
import '../../../provider./auth_provider.dart';

class OTPScreen extends ConsumerWidget {
  const OTPScreen({Key? key}) : super(key: key);

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
                    'Phone Verification',
                    style: TextStyle(
                        fontSize: height*0.022
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: height*0.1,),
            
            Container(
              width: width*0.6,
              child: Text('Please Enter The Code That Sent To 012345679',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: height*0.02,
              ),),
            ),

            SizedBox(height: height*0.1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: PinCodeTextField(
                length: 6,
                appContext: context,

                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),

                  activeFillColor: Colors.white,
                  inactiveColor: Colors.black45,
                  activeColor: Constants.mainColor2,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.white,
                  selectedColor: Constants.mainColor2,
                  errorBorderColor: Colors.transparent

                ),
                onChanged: (value) {

                },

              ),
            ),

            SizedBox(height: height*0.1,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>ResetPassword()));

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
