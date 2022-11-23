
import 'package:beauty_center/models/employee_model.dart';
import 'package:beauty_center/models/reservation_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';



final homeFuture =
ChangeNotifierProvider.autoDispose<HomeProvider>((ref) => HomeProvider());
class HomeProvider extends ChangeNotifier {

List<EmployeeModel> employees= [];


  HomeProvider(){
    getSchedule();
  }




getSchedule(){
employees = [
  EmployeeModel(
    reservations: [
      ReservationModel(
        timeStart: TimeOfDay(hour: 10,minute: 0),
        timeEnd: TimeOfDay(hour: 11, minute: 30),
        inSalon: false
      ),
      ReservationModel(
          timeStart: TimeOfDay(hour: 12,minute: 0),
          timeEnd: TimeOfDay(hour: 12, minute: 30),
          inSalon: true
      ),
      ReservationModel(
          timeStart: TimeOfDay(hour: 13,minute: 0),
          timeEnd: TimeOfDay(hour: 14, minute: 0),
          inSalon: true
      ),
      ReservationModel(
          timeStart: TimeOfDay(hour: 15,minute: 0),
          timeEnd: TimeOfDay(hour: 17, minute: 30),
          inSalon: false
      ),
      ReservationModel(
          timeStart: TimeOfDay(hour: 19,minute: 0),
          timeEnd: TimeOfDay(hour: 20, minute:0 ),
          inSalon: true
      ),
      ReservationModel(
          timeStart: TimeOfDay(hour: 20,minute: 30),
          timeEnd: TimeOfDay(hour: 21, minute: 0),
          inSalon: false
      ),

    ]
  ),
  EmployeeModel(
      reservations: [
        ReservationModel(
            timeStart: TimeOfDay(hour: 13,minute: 0),
            timeEnd: TimeOfDay(hour: 14, minute: 0),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 14,minute: 0),
            timeEnd: TimeOfDay(hour: 16, minute: 0),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 16,minute: 30),
            timeEnd: TimeOfDay(hour: 20, minute: 0),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 20,minute: 0),
            timeEnd: TimeOfDay(hour: 21, minute: 0),
            inSalon: false
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 21,minute: 30),
            timeEnd: TimeOfDay(hour: 22, minute:0 ),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 22,minute: 30),
            timeEnd: TimeOfDay(hour: 23, minute: 30),
            inSalon: false
        ),

      ]
  ),
  EmployeeModel(
      reservations: [
        ReservationModel(
            timeStart: TimeOfDay(hour: 10,minute: 0),
            timeEnd: TimeOfDay(hour: 11, minute: 30),
            inSalon: false
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 12,minute: 0),
            timeEnd: TimeOfDay(hour: 12, minute: 30),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 13,minute: 0),
            timeEnd: TimeOfDay(hour: 14, minute: 0),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 15,minute: 0),
            timeEnd: TimeOfDay(hour: 17, minute: 30),
            inSalon: false
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 19,minute: 0),
            timeEnd: TimeOfDay(hour: 20, minute:0 ),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 20,minute: 30),
            timeEnd: TimeOfDay(hour: 21, minute: 0),
            inSalon: false
        ),

      ]
  ),
  EmployeeModel(
      reservations: [
        ReservationModel(
            timeStart: TimeOfDay(hour: 13,minute: 0),
            timeEnd: TimeOfDay(hour: 14, minute: 0),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 14,minute: 0),
            timeEnd: TimeOfDay(hour: 16, minute: 0),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 16,minute: 30),
            timeEnd: TimeOfDay(hour: 20, minute: 0),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 20,minute: 0),
            timeEnd: TimeOfDay(hour: 21, minute: 0),
            inSalon: false
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 21,minute: 30),
            timeEnd: TimeOfDay(hour: 22, minute:0 ),
            inSalon: true
        ),
        ReservationModel(
            timeStart: TimeOfDay(hour: 22,minute: 30),
            timeEnd: TimeOfDay(hour: 23, minute: 30),
            inSalon: false
        ),

      ]
  ),
];
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