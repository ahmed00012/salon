
import 'dart:async';
import 'dart:io';

import 'package:beauty_center/models/salon_info_confirm.dart';
import 'package:beauty_center/repository/salon_info_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../main.dart';
import '../models/areas_model.dart';
import '../models/countries_model.dart';
import '../models/opening_day_model.dart';
import '../models/provider_info_model.dart';
import '../repository/auth_repository.dart';
import '../view/ui/salon_registeration/choose_categories.dart';
import '../view/widgets/time_picker_theme.dart';


final registerFuture =
ChangeNotifierProvider.autoDispose<RegisterProvider>((ref) => RegisterProvider());
class RegisterProvider extends ChangeNotifier {
  SalonInfoRepo salonInfoRepo = SalonInfoRepo();
  List<Country> countries = [];
  List<Cities> cities = [];
  List<Area> areas = [];

int? countryValue ;
int? cityValue ;
int? areaValue ;
double zoom = 7.0;
List<Marker> markers = <Marker>[];
List<String> recommendedPics = [
'assets/images/hair-salon.png',
  'assets/images/hairstyle.png',
  'assets/images/nail-polish.png',
  'assets/images/barbershop.png'
];
File? salonImage;
final ImagePicker _picker = ImagePicker();
String? pickedSalonLogo;
  File? licence;
  File? certification;
  List<File> images = [];
  int imageLength = 1;

List<OpeningDayModel> days = [];
List<String> holidays = [];
TimeOfDay open  = TimeOfDay(hour: 9, minute: 0);
TimeOfDay close = TimeOfDay(hour: 21, minute: 0);
  TextEditingController titleArController = TextEditingController();
  TextEditingController titleEnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController anotherPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController descriptionArController = TextEditingController();
  TextEditingController descriptionEnController = TextEditingController();
  TextEditingController yearOfExperience = TextEditingController();
  ProviderInfoModel providerInfoModel = ProviderInfoModel();


  RegisterProvider(){
    addMarker(LatLng(30.044611387091066, 31.231687873506743));
    getCountries();
    getProviderInfo();

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

  pickImageSalon() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    images.add(File(image!.path));
    addImage();
    notifyListeners();
  }


void addMarker(LatLng latLng) {
  markers=[];
  markers.add(
      Marker(
          markerId: const MarkerId('??????????'),
          draggable: true,
          position: latLng,
          infoWindow: const InfoWindow(
              title: '??????????'
          ),
          onDragEnd: ((newPosition) {
            print(newPosition.latitude);
            print(newPosition.longitude);
          })
      ));
  notifyListeners();
}


pickImage(bool recommended,{int ?index}) async {

    if(recommended) {
      pickedSalonLogo = recommendedPics[index!];
    } else
  {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      salonImage = File(image!.path);
    }
    notifyListeners();
}


determinePosition(Completer<GoogleMapController> googleMapController,) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    return Future.error('Location services are disabled.');
  }



  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await Geolocator.getCurrentPosition();
  addMarker(LatLng(position.latitude, position.longitude));
  moveCamera(googleMapController, LatLng(position.latitude, position.longitude));
  notifyListeners();
}

moveCamera(Completer<GoogleMapController> googleMapController,LatLng latLng)async{

  final GoogleMapController controller =  await googleMapController.future;
  controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
    target:latLng,
    zoom: 17,
  )));
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

setOpenAndCloseHours(TimeOfDay time,bool opening){
    if(opening)
      open = time;
    else
      close = time;
    notifyListeners();

}





setOpeningDays(int i, {TimeOfDay? opening, TimeOfDay? closing}){
    if(opening!=null)
    days[i].opening = opening;
    if(closing!=null)
      days[i].closing = closing;
    if(days[i].opening!=null &&  days[i].closing!=null)
      days[i].choosed=true;
    notifyListeners();
}

timePickerDialog(BuildContext context,int i){
  showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    helpText: 'Opening Time',
    builder: (BuildContext context, child) {
      return MyTimePickerTheme(child: child,);
    },
  ).then((value) {
    setOpeningDays(i,opening: value);
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'Close Time',
      builder: (BuildContext context, child) {
        return MyTimePickerTheme(child: child,);
      },
    ).then((value) {
     setOpeningDays(i,closing: value);
    });
  });
}



Future getCountries()async{
  var data = await salonInfoRepo.getCountries();
  if(data != false){
    countries = List.from(data.map((e)=>Country.fromJson(e)));
    countryValue = countries[0].id;
    cityValue = countries[0].cities![0].id;
    cities = List.from(countries[0].cities!);
    getAreas(cityValue!);
  }
  else{
    displayToastMessage('Something wrong happened !', true, navigatorKey.currentContext!);
  }
  notifyListeners();
}

Future getAreas(int city) async{
  var data = await salonInfoRepo.getAreas(city);
  if(data != false){
    areas = List.from(data.map((e)=>Area.fromJson(e)));
  }
  else{
    displayToastMessage('Something wrong happened !', true, navigatorKey.currentContext!);
  }
  notifyListeners();
}


selectCountry(Country country){
    countryValue = country.id;
    cities = List.from(country.cities!);
    cityValue = cities[0].id;
    notifyListeners();
}

selectCity(Cities city){
    cityValue = city.id;
    // cities = List.from(country.cities!);
    // cityValue = cities[0].title!.en;
    notifyListeners();
}


Future registerSalon(BuildContext context)async{
if(pickedSalonLogo!=null){
  salonImage = await getImageFileFromAssets(pickedSalonLogo!);
}
    SalonInfoRegistration salon = SalonInfoRegistration(
      titleAr: titleArController.text,
      titleEn: titleEnController.text,
      phone: phoneController.text,
      anotherPhone: anotherPhoneController.text,
      password: passwordController.text,
      descriptionAr: descriptionArController.text,
      descriptionEn: descriptionEnController.text,
      street: streetController.text,
      holidays: List.from(holidays),
      openAt: '${open.hour}:${open.minute}',
      closeAt: '${close.hour}:${close.minute}',
      areaId: areaValue,
      countryId: countryValue,
      cityId: cityValue,
      lat: markers[0].position.latitude,
      lng: markers[0].position.longitude,
      logoImg: salonImage,
      certificateImage: certification,
      licenseImage: licence,
      workImages: images,
      startExperience: yearOfExperience.text,
      type: LocalStorage.getData(key: 'gender')=='man'?1:2
    );


var data = await salonInfoRepo.registerInfo(salon);

print(data);
if(data!=false) {
  LocalStorage.saveData(key: 'token', value: 'Bearer ${data['access_token']}');
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => ChooseCategories()));
    }
  }


  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);
    File('${(await getTemporaryDirectory()).path}/$path').create(recursive: true);
    final buffer = byteData.buffer;
    return   File('${(await getTemporaryDirectory()).path}/$path').writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }

 double getHeight(){

    if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty&&phoneController.text.isNotEmpty&&
        anotherPhoneController.text.isNotEmpty && passwordController.text.isNotEmpty&& countryValue!=null &&
        cityValue!=null && streetController.text.isNotEmpty&& descriptionEnController.text.isNotEmpty&&
    descriptionArController.text.isNotEmpty){
      return 1;
    }
    else if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty&&phoneController.text.isNotEmpty&&
        anotherPhoneController.text.isNotEmpty && passwordController.text.isNotEmpty&& countryValue!=null &&
        cityValue!=null && streetController.text.isNotEmpty && descriptionEnController.text.isNotEmpty){
      return 0.85;
    }
    else if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty&&phoneController.text.isNotEmpty&&
        anotherPhoneController.text.isNotEmpty && passwordController.text.isNotEmpty&& countryValue!=null &&
        cityValue!=null && streetController.text.isNotEmpty){
      return 0.7;
    }
    else if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty&&phoneController.text.isNotEmpty&&
        anotherPhoneController.text.isNotEmpty && passwordController.text.isNotEmpty&& countryValue!=null &&
        cityValue!=null){
      return 0.56;
    }
    else if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty&&phoneController.text.isNotEmpty&&
        anotherPhoneController.text.isNotEmpty && passwordController.text.isNotEmpty){
      return 0.4;
    }
    else if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty&&phoneController.text.isNotEmpty&&
        anotherPhoneController.text.isNotEmpty){
      return 0.32;
    }

    else if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty&&phoneController.text.isNotEmpty){
      return 0.24;
    }
    else if(titleEnController.text.isNotEmpty && titleArController.text.isNotEmpty){
      return 0.16;
    }
    else if(titleEnController.text.isNotEmpty){
      return 0.08;
    }
    else {
      return 0;
    }

      notifyListeners();
  }
  
  
 Future getProviderInfo()async{
    if(LocalStorage.getData(key: 'token')!=null){
      var data = await salonInfoRepo.getProviderInfo();
      if(data!=false){
        providerInfoModel = ProviderInfoModel.fromJson(data);
      }

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