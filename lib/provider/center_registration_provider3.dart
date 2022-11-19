
import 'dart:async';
import 'dart:io';

import 'package:beauty_center/models/another_category_model.dart';
import 'package:beauty_center/models/packages_model.dart';
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
import '../models/employee_model.dart';
import '../models/opening_day_model.dart';
import '../repository/auth_repository.dart';
import '../view/widgets/time_picker_theme.dart';


final registerFuture3 =
ChangeNotifierProvider.autoDispose<RegisterProvider3>((ref) => RegisterProvider3());
class RegisterProvider3 extends ChangeNotifier {

List<EmployeeModel> employees = [];
List<PackagesModel> packages = [];
final ImagePicker _picker = ImagePicker();
List images = [];
int imageLength = 1;
List<CategoriesModel> categories=[];
bool workInHome = false;
List<String> holidays = [];
bool pets = false;
bool food = false;
bool children = false;
bool smoke = false;
bool material = false;
bool wifi = false;
bool photographer = false;
bool cafeShop = false;
bool bride = false;



  RegisterProvider3(){

    getCategories();
    setEmployee(0);
    setPackage(0);
  }

setEmployee(int i ,{String? name,String? phone, TimeOfDay? timeFrom, TimeOfDay? timeTo,File? photo}){
    if(i<employees.length){
      if(name!=null)
      employees[i].name = name;
      if(phone!=null)
        employees[i].phone = phone;
      if(timeFrom!=null)
        employees[i].availableFrom = timeFrom;
      if(timeTo!=null)
        employees[i].availableTo = timeTo;
      if(photo !=null)
        employees[i].photo = photo;

    }
    else{
      employees.add(
          EmployeeModel(
        name : name,
            phone: phone,
            photo: photo,
            availableFrom: timeFrom,
            availableTo: timeTo,

      ));
    }
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
}
chooseCategory(int i,int j){
 categories[i].subcategory![j].choose = !categories[i].subcategory![j].choose!;
  notifyListeners();
}
checkCanWorkInHome(){
    workInHome = !workInHome;
    notifyListeners();
}
chooseHolidays(String day ){
    if(holidays.contains(day)){
      holidays.remove(day);
    }
    else{
      holidays.add(day);
    }
    notifyListeners();
}

pickEmployeePhoto(int i) async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  setEmployee(i,photo:File(image!.path));
  notifyListeners();
}

setPackage(int i ,{String? title,String? price, String? saved,bool? extraService}){
  if(i<packages.length){
    if(title!=null)
      packages[i].title = title;
    if(price!=null)
      packages[i].price = price;
    if(saved!=null)
      packages[i].saved = saved;
    if(extraService!=null)
      packages[i].extraService = extraService;
  }
  else{
    packages.add(
        PackagesModel(
          title : title,
          price: price,
          saved: saved,
          extraService: false

        ));
  }
  notifyListeners();
}

choseForBride(){
  bride = !bride;
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