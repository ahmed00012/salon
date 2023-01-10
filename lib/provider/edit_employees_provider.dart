
import 'dart:async';
import 'dart:io';

import 'package:beauty_center/models/another_category_model.dart';
import 'package:beauty_center/models/packages_model.dart';
import 'package:beauty_center/models/provider_employees_model.dart';
import 'package:beauty_center/repository/employee_repository.dart';
import 'package:beauty_center/view/ui/salon_registeration/employees_register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../models/categories_model.dart';
import '../models/employee_model.dart';



final editEmployeeFuture =
ChangeNotifierProvider.autoDispose<EditEmployeeProvider>((ref) => EditEmployeeProvider());
class EditEmployeeProvider extends ChangeNotifier {

  EmployeeRepo employeeRepo = EmployeeRepo();
  List<ProviderEmployeesModel> employees = [];
  final ImagePicker _picker = ImagePicker();

  List<Services> services=[];





  EditEmployeeProvider(){
    // setEmployee();
    getServices();
  }

  // setEmployee(){
  //
  //   employees.add(
  //       EmployeeModel(
  //           name : '',
  //           phone: '',
  //           photo: null,
  //           availableFrom: TimeOfDay(hour: 9,minute: 0),
  //           availableTo: TimeOfDay(hour: 21,minute: 0),
  //           workOut: false,
  //           holidays: [],
  //           workImages: [],
  //           imageLength: 1,
  //           services: [],
  //           servicesModel: services,
  //           stored: false
  //
  //       ));
  //
  //   notifyListeners();
  // }
  //
  // setEmployeeName(int i , String name){
  //   employees[i].name = name;
  //   notifyListeners();
  // }
  // setEmployeePhone(int i , String phone){
  //   employees[i].phone = phone;
  //   notifyListeners();
  // }
  //
  // setEmployeeTime(int i , bool timeFrom,TimeOfDay value){
  //   if(timeFrom)
  //     employees[i].availableFrom = value;
  //   else
  //     employees[i].availableTo = value;
  //   notifyListeners();
  // }
  //
  // addImage(int i){
  //
  //   employees[i].imageLength = employees[i].imageLength! +1;
  //   notifyListeners();
  // }
  // removeImage(int i){
  //   employees[i].imageLength = employees[i].imageLength! -1;
  //   employees[i].workImages!.removeAt(i);
  //   notifyListeners();
  // }
  // pickImage(int i) async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   employees[i].workImages!.add(File(image!.path));
  //   addImage(i);
  //   notifyListeners();
  // }



  // chooseService(int employeeIndex,int serviceIndex){
  //   employees[employeeIndex].servicesModel![serviceIndex].choose =
  //   !employees[employeeIndex].servicesModel![serviceIndex].choose!;
  //
  //   if(employees[employeeIndex].servicesModel![serviceIndex].choose!)
  //     employees[employeeIndex].services!.add(employees[employeeIndex].servicesModel![serviceIndex].id!);
  //
  //   else
  //     employees[employeeIndex].services!.remove(employees[employeeIndex].servicesModel![serviceIndex].id!);
  //   notifyListeners();
  // }
  // checkCanWorkInHome(int i){
  //   employees[i].workOut = !employees[i].workOut!;
  //   notifyListeners();
  // }
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
  // pickEmployeePhoto(int i) async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   employees[i].photo = File(image!.path);
  //   notifyListeners();
  // }




  Future storeEmployee(EmployeeModel currentEmployee) async{
    // currentEmployee.stored = true;
    var data = await employeeRepo.storeEmployee(currentEmployee);
    print(data);
  }


  Future getServices()async{
   await getEmployees();
    var data = await employeeRepo.getServices();

    services = List.from(data.map((e)=>Services.fromJson(e)));

    employees.forEach((element) {element.servicesModel = List.from(services);});
    notifyListeners();

  }

  Future getEmployees()async{
    var data = await employeeRepo.getEmployees();
    employees = List.from(data['data'].map((e)=>ProviderEmployeesModel.fromJson(e)));
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