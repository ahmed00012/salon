
import 'package:beauty_center/models/countries_model.dart';
import 'package:beauty_center/models/user_model.dart';
import 'package:beauty_center/view/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../main.dart';
import '../models/areas_model.dart';
import '../repository/auth_repository.dart';
import '../view/ui/authentication/otp.dart';
import '../view/ui/authentication/reset_password.dart';
import '../view/widgets/bottom_nav.dart';


final authFuture =
ChangeNotifierProvider.autoDispose<AuthProvider>((ref) => AuthProvider());
class AuthProvider extends ChangeNotifier {
  AuthRepo authRepo =AuthRepo();
TextEditingController phoneController = TextEditingController();
TextEditingController phoneForgetPasswordController = TextEditingController();
TextEditingController passwordController = TextEditingController();
  TextEditingController pin = TextEditingController();
  String deviceToken = '';
  String ?verificationCode;
  int timer = 60;



static String? imageBackGround;



  AuthProvider(){



  }

String getGender(){
    return LocalStorage.getData(key: 'gender');
}


Future login(BuildContext context)async{
    UserModel user = UserModel(
      phone: phoneController.text,
      password: passwordController.text
    );

    var data = await authRepo.login(user.toJson());
    print(data);

    if(data!=false){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>BottomNavBar()), (route) => false);
    }
    else{
      displayToastMessage('Failed Authentication', true, context);
    }
}

  forgetPassword(BuildContext context)async {

    var response = await authRepo.forgetPassword({'phone': phoneForgetPasswordController.text,});
    if(response==false){
      // displayToastMessage('حدث خطأ',true);
      print('0z0z00x0xz');
    }
    else if(response =='not valid'){
      // displayToastMessage('هذا الرقم غير مسجل', true);
      print('0ddddddddddddddd');
    }
    else{
      verifyPhone(phoneForgetPasswordController.text);
      decreasingTimer();
      Navigator.push(context, MaterialPageRoute(
          builder: (_)=>OTPScreen(phoneNumber:phoneForgetPasswordController.text ,forgetPassword: true,)
      ));
    }


  }

  decreasingTimer()async{
    for(int i = 0 ; i <= 60 ; i++) {
      await  Future.delayed(Duration(seconds: 1), () {
        timer = 60 - i;
        notifyListeners();
      });
    }
  }


  verifyPhone(String phone) async {

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+20${phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          // displayToastMessage(e.message, true);
        },
        codeSent: (String? verficationID, int ?resendToken) {
          verificationCode = verficationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          verificationCode = verificationID;
        },
        timeout: Duration(seconds: 60));
  }




  finishOtpRegister(BuildContext context,String phone)async{
    try
    {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationCode!, smsCode: pin.text))
          .then((value) async {
        if (value.user != null) {
          var response = await authRepo.verify({
            'phone':phone,
            'fcm_token': deviceToken,
          });
          if (response != false) {
            // LocalStorage.saveData(
            //     key: 'token', value: 'Bearer ' +response['access_token']);
            // LocalStorage.saveData(
            //     key: 'name', value: response['client']['name']);
            // LocalStorage.saveData(
            //     key: 'phone', value: response['client']['phone']);
            // LocalStorage.saveData(
            //     key: 'image', value: response['client']['image']??'');
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => SplashScreen()),
            //         (route) => false);
          } else {
            // displayToastMessage(response['message'], true);
          }
        }
      });
    }
    catch (e){

    }
  }

  finishOtpForgetPassword(BuildContext context,String phone)async{
    try
    {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationCode!, smsCode: pin.text))
          .then((value) async {
        if (value.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ResetPassword()),
                  (route) => false);
        }
      });
    }
    catch (e){

    }
  }

  void displayToastMessage(var toastMessage, bool alert,BuildContext context) {
    showTopSnackBar(
      context,
      alert ?
      CustomSnackBar.error(
        message:
        toastMessage,
      ) :
      CustomSnackBar.success(
        message:
        toastMessage,
      ),
    );
  }


}