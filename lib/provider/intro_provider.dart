

import 'package:beauty_center/local_storage.dart';
import 'package:beauty_center/main.dart';
import 'package:beauty_center/repository/on_boarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/onbording.dart';

final introFuture =
ChangeNotifierProvider.autoDispose<IntroProvider>((ref) => IntroProvider());
class IntroProvider extends ChangeNotifier {
  OnBoardingRepo onBoardingRepo = OnBoardingRepo();
  OnBoardingContent onBoardingContent = OnBoardingContent();
  int currentGender = 1;
  IntroProvider(){

    getIntroData();
  }

  Future getIntroData({int ?gender})async{
    var data = await onBoardingRepo.getIntro(gender: gender);
    print(data);

    if(data!=false){
      onBoardingContent = OnBoardingContent.fromJson(data);
    }
    else{
      displayToastMessage('Something wrong happened !', true, navigatorKey.currentContext!);
    }
    notifyListeners();

  }


  void identifyGender(int gender){
    currentGender = gender;
    if(gender == 1 ){
      LocalStorage.saveData(key: 'gender', value: 'man');
      getIntroData(gender: gender);
    }
    else{
      LocalStorage.saveData(key: 'gender', value: 'woman');
      getIntroData(gender: gender);
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