
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../repository/auth_repository.dart';


final registerFuture =
ChangeNotifierProvider.autoDispose<RegisterProvider>((ref) => RegisterProvider());
class RegisterProvider extends ChangeNotifier {

  bool phoneLoginFocus = false;
  bool passwordLoginFocus = false;
  bool phoneSignupFocus = false;
  bool passwordSignupFocus = false;
  bool nameSignupFocus = false;
  bool phoneForgotPasswordFocus = false;
  bool passwordResetPasswordFocus = false;
  bool passwordResetPasswordFocus2 = false;

  static String? imageBackGround;



  RegisterProvider(){


  }





  switchFocus(bool focus,String field){
    if(field=='phoneLoginFocus') {
      phoneLoginFocus = focus;
    }
    else if(field=='passwordLoginFocus'){
      passwordLoginFocus = focus;
    }
    else if(field=='passwordLoginFocus'){
      passwordLoginFocus = focus;
    }
    else if(field=='phoneSignupFocus'){
      phoneSignupFocus = focus;
    }
    else if(field=='passwordSignupFocus'){
      passwordSignupFocus = focus;
    }
    else if(field=='nameSignupFocus'){
      nameSignupFocus = focus;
    }
    else if(field=='phoneForgotPasswordFocus'){
      phoneForgotPasswordFocus = focus;
    }
    else if(field=='passwordResetPasswordFocus'){
      passwordResetPasswordFocus = focus;
    }
    else if(field=='passwordResetPasswordFocus2'){
      passwordResetPasswordFocus2 = focus;
    }


    notifyListeners();
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