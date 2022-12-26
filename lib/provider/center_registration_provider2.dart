
import 'dart:async';
import 'dart:io';

import 'package:beauty_center/models/another_category_model.dart';
import 'package:beauty_center/models/service_json_model.dart';
import 'package:beauty_center/repository/services_repository.dart';
import 'package:beauty_center/view/ui/salon_registeration/employees_register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../models/categories0_model.dart';
import '../models/categories_model.dart';
import '../models/opening_day_model.dart';
import '../repository/auth_repository.dart';
import '../view/widgets/time_picker_theme.dart';


final registerFuture2 =
ChangeNotifierProvider.autoDispose<RegisterProvider2>((ref) => RegisterProvider2());
class RegisterProvider2 extends ChangeNotifier {

  ServicesRepo servicesRepo = ServicesRepo();

  List<CategoriesModel0> categories=[];
  List<CategoriesModel> categories2=[];
  List<String> anotherCategories=[];
 List <AnotherCategoryModel>chosenAnotherCategories =[];
 int anotherCategoriesLength = 1;
 bool haveEmployees = false;





  RegisterProvider2(){

    getCategories();
  }





  Future getCategories()async{

    var data = await servicesRepo.getCategories();
    
    if(data!=false){
      categories2 = List<CategoriesModel>.from(data.map((e)=>CategoriesModel.fromJson(e)));
      categories2.forEach((element) {
        element.services!.forEach((service) {
          service.priceFrom = 0;
          service.priceTo = 100;
          service.duration = 30;
        });
      });

    }
notifyListeners();
  }

chooseCategory(bool choose , int i,int  j){
    if(choose) {
        categories2[i].services![j].choose = true;
        categories2[i].services!.forEach((element) {
        });

    }
    else{

        categories2[i].services![j].choose = false;
        categories2[i].services!.forEach((element) {

        });
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

setPrice(bool from, String value, int i , int j){
    if(from)
      categories2[i].services![j].priceFrom = int.parse(value);
    else
      categories2[i].services![j].priceTo = int.parse(value);

    notifyListeners();
}


setDuration(bool plus, int i , int j){
    if(plus){
      categories2[i].services![j].duration = categories2[i].services![j].duration! + 30;
    }
    else{
      if(categories2[i].services![j].duration! > 30)
      categories2[i].services![j].duration = categories2[i].services![j].duration! - 30;
    }
    notifyListeners();
}


storeServices(BuildContext context)async{
  SalonServices salonServices = SalonServices(
    services: []
  );

   categories2.forEach((element) {
     element.services!.forEach((service) {
       if(service.choose!) {
          ServiceJsonModel serviceJson = ServiceJsonModel(
            id: service.id,
            duration: service.duration.toString(),
            priceFrom: service.priceFrom,
            priceTo: service.priceTo,
          );
          salonServices.services!.add(serviceJson);

        }
      });
   });



   var data = await servicesRepo.storeServices(salonServices.toJson());
   if(data!= false){
     Navigator.push(context, MaterialPageRoute(builder: (_)=>EmployeesRegister()));
   }
   else{
     displayToastMessage('Somthing wrong !',true,context);
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