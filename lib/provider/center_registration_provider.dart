
import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../constants.dart';
import '../local_storage.dart';
import '../repository/auth_repository.dart';


final registerFuture =
ChangeNotifierProvider.autoDispose<RegisterProvider>((ref) => RegisterProvider());
class RegisterProvider extends ChangeNotifier {
List<String> countries = ['Egypt', 'Emirates'];
List<String> cities = ['Cairo','Alexandria','Tanta'];
List<String> areas = ['Moharam Bek','Miami','Sidi Beshr'];

String? countryValue = 'Egypt';
String? cityValue = 'Cairo';
String? areaValue = 'Moharam Bek';
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


  RegisterProvider(){
    addMarker(LatLng(30.044611387091066, 31.231687873506743));

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