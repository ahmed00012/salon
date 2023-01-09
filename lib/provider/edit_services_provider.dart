
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:beauty_center/local_storage.dart';
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
import '../models/categories_model.dart';
import '../models/provider_services_model.dart';


final editServicesFuture =
ChangeNotifierProvider.autoDispose<EditServicesProvider>((ref) => EditServicesProvider());
class EditServicesProvider extends ChangeNotifier {

  ServicesRepo servicesRepo = ServicesRepo();


  List<CategoriesModel> categories=[];
  List<String> anotherCategories=[];
  List <AnotherCategoryModel>chosenAnotherCategories =[];
  int anotherCategoriesLength = 1;
  List<ProviderServicesModel> providerServices = [];






  EditServicesProvider(){

    getCategories();

  }





  Future getCategories()async{

    var data = await servicesRepo.getCategories();

    if(data!=false){
      categories = List<CategoriesModel>.from(data.map((e)=>CategoriesModel.fromJson(e)));
      categories.forEach((element) {
        element.services!.forEach((service) {
          service.priceFrom = 0;
          service.priceTo = 100;
          service.duration = 30;
        });
      });

      getProviderServices();

    }
    notifyListeners();
  }

  chooseCategory(bool choose , int i,int  j){
    if(choose) {
      categories[i].services![j].choose = true;
      categories[i].services!.forEach((element) {
      });

    }
    else{

      categories[i].services![j].choose = false;
      categories[i].services!.forEach((element) {

      });
    }
    notifyListeners();
  }

  addAnotherCategory(){
    if(anotherCategoriesLength<6)
      anotherCategoriesLength++;
    notifyListeners();
  }



  setPrice(bool from, String value, int i , int j){
    if(from)
      categories[i].services![j].priceFrom = int.parse(value);
    else
      categories[i].services![j].priceTo = int.parse(value);

    notifyListeners();
  }


  setDuration(bool plus, int i , int j){
    if(plus){
      categories[i].services![j].duration = categories[i].services![j].duration! + 30;
    }
    else{
      if(categories[i].services![j].duration! > 30)
        categories[i].services![j].duration = categories[i].services![j].duration! - 30;
    }
    notifyListeners();
  }


  storeServices(BuildContext context,{bool? update})async{
    SalonServices salonServices = SalonServices(
        services: []
    );

    categories.forEach((element) {
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
      if(update==null)
      Navigator.push(context, MaterialPageRoute(builder: (_)=>EmployeesRegister()));
      else {
        Navigator.pop(context);
        displayToastMessage('Your Services Updated Successfully',false,context);
      }
    }
    else{
      displayToastMessage('Somthing wrong !',true,context);
    }
  }

 Future getProviderServices() async{

 var data = await  servicesRepo.getProviderServices();
   if(data!=false){
     providerServices = List.from(data.map((e)=>ProviderServicesModel.fromJson(e)));

    categories.forEach((element) {
      element.services!.forEach((element2) {
        providerServices.forEach((element3) {
          if(element2.id == element3.id){
            element2.choose = true;
            element2.priceFrom = element3.pivot!.priceFrom;
            element2.priceTo = element3.pivot!.priceTo;
            element2.duration = element3.pivot!.duration;
          }
        });
      });
    });
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
        backgroundColor: Constants.mainColor2,
      ),
    );
  }


}