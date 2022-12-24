
import 'dart:async';
import 'dart:io';

import 'package:beauty_center/local_storage.dart';
import 'package:beauty_center/models/another_category_model.dart';
import 'package:beauty_center/models/packages_model.dart';
import 'package:beauty_center/repository/employee_repository.dart';
import 'package:beauty_center/view/ui/salon_registeration/employees_register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../models/categories0_model.dart';
import '../models/categories_model.dart';
import '../models/employee_model.dart';
import '../repository/package_repository.dart';



final packageFuture =
ChangeNotifierProvider.autoDispose<PackageProvider>((ref) => PackageProvider());
class PackageProvider extends ChangeNotifier {

  PackageRepo packageRepo = PackageRepo();

  List<PackagesModel> packages = [];
  final ImagePicker _picker = ImagePicker();

  List<Services> services=[];


  bool pets = false;
  bool food = false;
  bool children = false;
  bool smoke = false;
  bool material = false;
  bool wifi = false;
  bool photographer = false;
  bool cafeShop = false;
  bool bride = false;



  PackageProvider(){

    getServices();
     setPackage();

  }
  setPackage(){

    packages.add(
        PackagesModel(
            titleAr : '',
            titleEn: '',
            descriptionAr: '',
            descriptionEn: '',
            image: null,
            from: '',
            to:'',
            services: [],
            servicesModel: services,
            saved: false,
          isPride: false,
          type: LocalStorage.getData(key: 'gender'),
          price: '',
          newPrice: ''

        ));

    notifyListeners();
  }


  Future getServices()async{
    var data = await packageRepo.getServices();

    services = List.from(data.map((e)=>Services.fromJson(e)));

    packages.forEach((element) {element.servicesModel = List.from(services);});
    notifyListeners();

  }


  pickImage(int i) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    packages[i].image = File(image!.path);
    notifyListeners();
  }

  chooseService(int employeeIndex,int serviceIndex){
    packages[employeeIndex].servicesModel![serviceIndex].choose =
    !packages[employeeIndex].servicesModel![serviceIndex].choose!;

    if(packages[employeeIndex].servicesModel![serviceIndex].choose!)
      packages[employeeIndex].services!.add(packages[employeeIndex].servicesModel![serviceIndex].id!);

    else
      packages[employeeIndex].services!.remove(packages[employeeIndex].servicesModel![serviceIndex].id!);
    notifyListeners();
  }
  checkForPride(int i){
    packages[i].isPride = !packages[i].isPride!;
    notifyListeners();
  }
  // chooseHolidays(int i ,String day ){
  //   if(employees[i].holidays!.contains(day)){
  //     employees[i].holidays!.remove(day);
  //   }
  //   else{
  //     employees[i].holidays!.add(day);
  //   }
  //   notifyListeners();
  // }
  //

  //

  //
  Future storePackage(PackagesModel packagesModel) async{
    packagesModel.saved = true;
    var data = await packageRepo.storePackage(packagesModel);
    print(data);
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