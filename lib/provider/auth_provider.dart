
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../repository/auth_repository.dart';


final authFuture =
ChangeNotifierProvider.autoDispose<AuthProvider>((ref) => AuthProvider());
class AuthProvider extends ChangeNotifier {
  AuthRepo followersRepo =AuthRepo();
  bool phoneLoginFocus = false;
  bool passwordLoginFocus = false;




  AuthProvider(){


  }



  switchFocus(bool focus,String field){
    if(field=='phoneLoginFocus') {
      phoneLoginFocus = focus;
    }
    else if(field=='passwordLoginFocus'){
      passwordLoginFocus = focus;
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