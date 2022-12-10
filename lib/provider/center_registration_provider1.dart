
import 'dart:async';
import 'dart:io';

import 'package:beauty_center/repository/salon_info_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../main.dart';
import '../models/areas_model.dart';
import '../models/countries_model.dart';
import '../models/opening_day_model.dart';
import '../repository/auth_repository.dart';
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

List<OpeningDayModel> days = [];
List<String> holidays = [];
TimeOfDay ?open ;
TimeOfDay ?close ;
  TextEditingController titleArController = TextEditingController();
  TextEditingController titleEnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController anotherPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController descriptionArController = TextEditingController();
  TextEditingController descriptionEnController = TextEditingController();


  RegisterProvider(){
    addMarker(LatLng(30.044611387091066, 31.231687873506743));
    getOpeningTimes();
    getCountries();

  }




void addMarker(LatLng latLng) {
  markers=[];
  markers.add(
      Marker(
          markerId: const MarkerId('موقعي'),
          draggable: true,
          position: latLng,
          infoWindow: const InfoWindow(
              title: 'موقعي'
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

getOpeningTimes(){
    days = [
      OpeningDayModel(
        id: 1,
        day: 'Sat',
        choosed: false
      ),
      OpeningDayModel(
          id: 2,
          day: 'Sun',
          choosed: false
      ),
      OpeningDayModel(
          id: 3,
          day: 'Mon',
          choosed: false
      ),
      OpeningDayModel(
          id: 4,
          day: 'Tue',
          choosed: false
      ),
      OpeningDayModel(
          id: 5,
          day: 'Wed',
          choosed: false
      ),
      OpeningDayModel(
          id: 6,
          day: 'Thu',
          choosed: false
      ),
      OpeningDayModel(
          id: 7,
          day: 'Fri',
          choosed: false
      ),
    ];
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