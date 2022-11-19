
import 'dart:async';
import 'dart:io';

import 'package:beauty_center/models/another_category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../models/categories_model.dart';
import '../models/opening_day_model.dart';
import '../repository/auth_repository.dart';
import '../view/widgets/time_picker_theme.dart';


final registerFuture2 =
ChangeNotifierProvider.autoDispose<RegisterProvider2>((ref) => RegisterProvider2());
class RegisterProvider2 extends ChangeNotifier {

  File? licence;
  File? certification;
  final ImagePicker _picker = ImagePicker();
  List images = [];
  int imageLength = 1;
  List<CategoriesModel> categories=[];
  List<String> anotherCategories=[];
 List <AnotherCategoryModel>chosenAnotherCategories =[];
 int anotherCategoriesLength = 1;
 bool haveEmployees = false;





  RegisterProvider2(){
    getCategories();
  }


  removeLicence(){
    licence= null;
    notifyListeners();
  }
  removeCertification(){
    certification= null;
    notifyListeners();
  }
  addImage(){
    if(images.length==imageLength&&imageLength<11)
      imageLength = imageLength +1;
    notifyListeners();
  }
  removeImage(int i){
    imageLength = imageLength -1;
    images.removeAt(i);
    notifyListeners();
  }

  pickLicence() async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      licence=File(image!.path);
    notifyListeners();
  }
  pickCertification() async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      certification=File(image!.path);
    notifyListeners();
  }

  pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    images.add(File(image!.path));
    addImage();
    notifyListeners();
  }


  getCategories(){
    categories = [
      CategoriesModel(
        id: 1,
        name: 'Hair',
        choose: false,
        subcategory: [
          CategoriesModel(name: 'cut',choose: false,inHome: false,inSalon: false),
          CategoriesModel(name: 'straight',choose: false,inHome: false,inSalon: false),
          CategoriesModel(name:  'iron',choose: false,inHome: false,inSalon: false),
          CategoriesModel(name: 'burn',choose: false,inHome: false,inSalon: false),
        ]
      ),
      CategoriesModel(
        id: 2,
        name: 'face',
          choose: false,
        subcategory: [
          CategoriesModel(name: 'mask',choose: false,inHome: false,inSalon: false),
          CategoriesModel(name: 'hot towel',choose: false,inHome: false,inSalon: false),
          CategoriesModel(name: 'clean',choose: false,inHome: false,inSalon: false),
          CategoriesModel(name: 'remove hair',choose: false,inHome: false,inSalon: false),
        ]
      ),
      CategoriesModel(
        id: 3,
        name: 'fingernails',
          choose: false,
       subcategory: [
          CategoriesModel(name: 'cut',choose: false,inHome: false,inSalon: false),

    ]
      )
    ];
    categories.forEach((element) {
      anotherCategories.add(element.name!);
    });

  }

chooseCategory(bool subCategory ,bool choose , int i,{int ? j}){
    if(choose) {
      if (subCategory) {
        int chosenSubCategories = 0;
        categories[i].subcategory![j!].choose = true;
        categories[i].subcategory!.forEach((element) {
          if(element.choose!)
            chosenSubCategories++;
        });
        if(chosenSubCategories==categories[i].subcategory!.length){
          categories[i].choose=true;
        }
      }
      else {
        categories[i].choose = true;
        categories[i].subcategory!.forEach((element) {
          element.choose = true;
        });
      }

    }
    else{
      if (subCategory) {
        int unChosenSubCategories = 0;
        categories[i].subcategory![j!].choose = false;
        categories[i].subcategory!.forEach((element) {
          if(!element.choose!)
            unChosenSubCategories++;
        });
        if(unChosenSubCategories!=categories[i].subcategory!.length){
          categories[i].choose=false;
        }
      }
      else {
        categories[i].choose = false;
        categories[i].subcategory!.forEach((element) {
          element.choose = false;
        });
      }
    }
    notifyListeners();
}

addAnotherCategory(){
if(anotherCategoriesLength<6)
      anotherCategoriesLength++;
    notifyListeners();
}

markHomeSalon(int i,int j,{bool ?inHome,bool? inSalon}){
    if(inHome!=null)
    categories[i].subcategory![j].inHome = inHome;
    if(inSalon!=null)
      categories[i].subcategory![j].inSalon = inSalon;
    notifyListeners();
}

markHaveEmployees(){
    haveEmployees = !haveEmployees;
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