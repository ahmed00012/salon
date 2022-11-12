
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

  List licences = [];
  final ImagePicker _picker = ImagePicker();
  int licenceLength = 1;
  List images = [];
  int imageLength = 1;
  List<CategoriesModel> categories=[];
  List<String> anotherCategories=[];
 List <AnotherCategoryModel>chosenAnotherCategories =[];
 int anotherCategoriesLength = 1;





  RegisterProvider2(){
    getCategories();
  }

  addLicence(){
    if(licences.length==licenceLength&&licenceLength<6)
    licenceLength = licenceLength +1;
    notifyListeners();
  }
  removeLicence(int i){
    licenceLength = licenceLength -1;
    licences.removeAt(i);
    notifyListeners();
  }
  addImage(){
    if(images.length==imageLength&&licenceLength<10)
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
      licences.add(File(image!.path));
    notifyListeners();
  }

  pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    images.add(File(image!.path));
    notifyListeners();
  }


  getCategories(){
    categories = [
      CategoriesModel(
        id: 1,
        name: 'Hair',
        choose: false,
        subcategory: [
          CategoriesModel(name: 'cut',choose: false),
          CategoriesModel(name: 'straight',choose: false),
          CategoriesModel(name:  'iron',choose: false),
          CategoriesModel(name: 'burn',choose: false),
        ]
      ),
      CategoriesModel(
        id: 2,
        name: 'face',
          choose: false,
        subcategory: [
          CategoriesModel(name: 'mask',choose: false),
          CategoriesModel(name: 'hot towel',choose: false),
          CategoriesModel(name: 'clean',choose: false),
          CategoriesModel(name: 'remove hair',choose: false),
        ]
      ),
      CategoriesModel(
        id: 3,
        name: 'fingernails',
          choose: false,
        subcategory: []
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