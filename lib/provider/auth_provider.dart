
import 'package:beauty_center/models/countries_model.dart';
import 'package:beauty_center/models/user_model.dart';
import 'package:beauty_center/view/ui/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../main.dart';
import '../models/areas_model.dart';
import '../repository/auth_repository.dart';
import '../view/widgets/bottom_nav.dart';


final authFuture =
ChangeNotifierProvider.autoDispose<AuthProvider>((ref) => AuthProvider());
class AuthProvider extends ChangeNotifier {
  AuthRepo authRepo =AuthRepo();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();




static String? imageBackGround;



  AuthProvider(){



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