
import 'package:beauty_center/models/employee_model.dart';
import 'package:beauty_center/models/employee_time.dart';
import 'package:beauty_center/models/reservation_model.dart';
import 'package:beauty_center/view/ui/make_reservation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';



final homeFuture =
ChangeNotifierProvider.autoDispose<HomeProvider>((ref) => HomeProvider());
class HomeProvider extends ChangeNotifier {

List<EmployeeModel> employees= [];
List<TimeOfDay> timeOpening= [
  TimeOfDay(hour: 9, minute: 0),
  TimeOfDay(hour: 10, minute: 0),
  TimeOfDay(hour: 11, minute: 0),
  TimeOfDay(hour: 12, minute: 0),
  TimeOfDay(hour: 13, minute: 0),
  TimeOfDay(hour: 14, minute: 0),
  TimeOfDay(hour: 15, minute: 0),
  TimeOfDay(hour: 16, minute: 0),
  TimeOfDay(hour: 17, minute: 0),
  TimeOfDay(hour: 18, minute: 0),
  TimeOfDay(hour: 19, minute: 0),
  TimeOfDay(hour: 20, minute: 0),
  TimeOfDay(hour: 21, minute: 0),
  TimeOfDay(hour: 22, minute: 0),
  TimeOfDay(hour: 23, minute: 0),
  TimeOfDay(hour: 0, minute: 0),
  TimeOfDay(hour: 1, minute: 0),


];

String date = DateFormat('EEEE').format(DateTime.now()).toString()+ '  '+
    DateTime.now().toString().substring(0,10);
DateTime dateTime = DateTime.now();
// List<TimePlannerTask> tasks = [
//   TimePlannerTask(
//     color: Colors.purple,
//     dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
//     minutesDuration: 90,
//     daysDuration: 5,
//     onTap: () {},
//     child: Text(
//       'this is a task',
//       style: TextStyle(color: Colors.grey[350], fontSize: 12),
//     ),
//   ),
// ];

  HomeProvider(){
    employeeTime();
  }




Future getSchedule()async{
  var format = DateFormat("HH:mm");


employees = [
  EmployeeModel(
    name: 'Ahmed',
    image: 'assets/images/sergio-de-paula-c_GmwfHBDzk-unsplash.jpg',
    times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
      hour: timeOpening[counter],
      busyAll: false,
      free: true,
      halfAbove: false,
      halfBottom: false,
      inSalon: false,
      onBreak: false
    )),


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
      name: 'Osama',
      image: 'assets/images/vince-fleming-j3lf-Jn6deo-unsplash.jpg',
      times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
        hour: timeOpening[counter],
        busyAll: false,
        free: true,
        halfAbove: false,
        halfBottom: false,
        inSalon: false,
          onBreak: false
      )),

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
      name: 'Maha',
     image: 'assets/images/jake-nackos-IF9TK5Uy-KI-unsplash.jpg',
      times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
        hour: timeOpening[counter],
        busyAll: false,
        free: true,
        halfAbove: false,
        halfBottom: false,
        inSalon: false,
          onBreak: false
      )),

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
      name: 'Bassant',
      image: 'assets/images/houcine-ncib-B4TjXnI0Y2c-unsplash(1).jpg',
      times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
        hour: timeOpening[counter],
        busyAll: false,
        free: true,
        halfAbove: false,
        halfBottom: false,
        inSalon: false,
          onBreak: false
      )),

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
employees.forEach((element) {

  // element.times = list;
  element.reservations!.forEach((element2) {
    var one = format.parse("${element2.timeStart!.hour}:${element2.timeStart!.minute}");
    var two = format.parse("${element2.timeEnd!.hour}:${element2.timeEnd!.minute}");
    element2.duration = two.difference(one);
  });

});

notifyListeners();

}

employeeTime() async{

await getSchedule();

    employees.forEach((element) {
      print(element.times!.length);
      element.reservations!.forEach((element2) {
       for(int i = 0 ; i <element.times!.length; i++) {

         if (element2.timeStart!.hour == element.times![i].hour!.hour) {
           element.times![i].free = false;
           element.times![i].inSalon = element2.inSalon;
           if (element2.timeStart!.minute != 0) {
             element.times![i].halfBottom = true;
           }
           else {
             element.times![i].busyAll = true;
           }
         }
         //
         if (element2.timeEnd!.hour == element.times![i].hour!.hour) {
           element.times![i].free = false;
           element.times![i].inSalon = element2.inSalon;
           if (element2.timeEnd!.minute != 0) {
             element.times![i].busyAll = true;
             // next = true;


           }
           else {
             element.times![i].busyAll = true;
           }
         }

         if (element.times![i].hour!.hour> element2.timeStart!.hour &&
             element.times![i].hour!.hour < element2.timeEnd!.hour) {

           element.times![i].free = false;
           element.times![i].inSalon = element2.inSalon;
           element.times![i].busyAll = true;
         }
       }
        });
      });

    notifyListeners();
}



setDate(DateTime chosenDate){
date = DateFormat('EEEE').format(chosenDate).toString()+ '  '+
    chosenDate.toString().substring(0,10);
dateTime = chosenDate;
print(date);
notifyListeners();
}

makeReservation(BuildContext context, int i , int j){
  print(employees[i].times![j].onBreak );
    showDialog(context: context,
        builder: (context){
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
               employees[i].times![j].onBreak = true;
               employees[i].times![j].free = false;
               Navigator.pop(context);
              },
              child: Container(
                height: 40,
                child: Center(child: Text('Close a While')),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_)=>MakeReservation(
                  date: date,
                  employeeModel: employees[i],
                  time: employees[i].times![j].hour,
                )));
              },
              child: Container(
                height: 40,
                child: Center(child: Text('Make Reservation')),
              ),
            ),
          ],
        ),
      );
        }).then((value) => notifyListeners());
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