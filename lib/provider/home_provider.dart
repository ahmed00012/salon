
import 'package:beauty_center/models/employee_model.dart';
import 'package:beauty_center/models/employee_time.dart';
import 'package:beauty_center/repository/home_repository.dart';

import 'package:beauty_center/view/ui/make_reservation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/employees_times_model.dart';



final homeFuture =
ChangeNotifierProvider.autoDispose<HomeProvider>((ref) => HomeProvider());
class HomeProvider extends ChangeNotifier {

  HomeRepo repo = HomeRepo();
List<EmployeeModel> employees= [];
  List<EmployeesTimeModel> employeeSchedule = [];
List<String> timeOpening= [
  '09:00',
  '09:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '15:30',
  '16:00',
  '16:30',
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
  '19:30',
  '20:00',
  '20:30',
  '21:00',
  '21:30',
  '22:00',
  '22:30',
  '23:00',
  '23:30',

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
    getSchedule2();
  }




Future getSchedule()async{
  var format = DateFormat("HH:mm");


employees = [
  EmployeeModel(
    name: 'Ahmed',
    image: 'assets/images/sergio-de-paula-c_GmwfHBDzk-unsplash.jpg',
    times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
      // hour: timeOpening[counter],
      busyAll: false,
      free: true,
      halfAbove: false,
      halfBottom: false,
      inSalon: false,
      onBreak: false
    )),


    orders: [
    ]
  ),
  EmployeeModel(
      name: 'Osama',
      image: 'assets/images/vince-fleming-j3lf-Jn6deo-unsplash.jpg',
      times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
        // hour: timeOpening[counter],
        busyAll: false,
        free: true,
        halfAbove: false,
        halfBottom: false,
        inSalon: false,
          onBreak: false
      )),

      orders: [

      ]
  ),
  EmployeeModel(
      name: 'Maha',
     image: 'assets/images/jake-nackos-IF9TK5Uy-KI-unsplash.jpg',
      times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
        // hour: timeOpening[counter],
        busyAll: false,
        free: true,
        halfAbove: false,
        halfBottom: false,
        inSalon: false,
          onBreak: false
      )),

      orders: [
      ]
  ),
  EmployeeModel(
      name: 'Bassant',
      image: 'assets/images/houcine-ncib-B4TjXnI0Y2c-unsplash(1).jpg',
      times: List<EmployeeTime>.generate(timeOpening.length,(counter) =>EmployeeTime(
        // hour: timeOpening[counter],
        busyAll: false,
        free: true,
        halfAbove: false,
        halfBottom: false,
        inSalon: false,
          onBreak: false
      )),

      orders: [


      ]
  ),
];
employees.forEach((element) {

  // element.times = list;
  // element.orders!.forEach((element2) {
  //   var one = format.parse("${element2.timeStart!.hour}:${element2.timeStart!.minute}");
  //   var two = format.parse("${element2.timeEnd!.hour}:${element2.timeEnd!.minute}");
  //   element2.duration = two.difference(one);
  // });

});

notifyListeners();

}

employeeTime() async{

await getSchedule();

    employees.forEach((element) {
      print(element.times!.length);
      // element.orders!.forEach((element2) {
      //  for(int i = 0 ; i <element.times!.length; i++) {
      //
      //    if (element2.timeStart!.hour == element.times![i].hour!.hour) {
      //      element.times![i].free = false;
      //      element.times![i].inSalon = element2.inSalon;
      //      if (element2.timeStart!.minute != 0) {
      //        element.times![i].halfBottom = true;
      //      }
      //      else {
      //        element.times![i].busyAll = true;
      //      }
      //    }
      //    //
      //    if (element2.timeEnd!.hour == element.times![i].hour!.hour) {
      //      element.times![i].free = false;
      //      element.times![i].inSalon = element2.inSalon;
      //      if (element2.timeEnd!.minute != 0) {
      //        element.times![i].busyAll = true;
      //        // next = true;
      //
      //
      //      }
      //      else {
      //        element.times![i].busyAll = true;
      //      }
      //    }
      //
      //    if (element.times![i].hour!.hour> element2.timeStart!.hour &&
      //        element.times![i].hour!.hour < element2.timeEnd!.hour) {
      //
      //      element.times![i].free = false;
      //      element.times![i].inSalon = element2.inSalon;
      //      element.times![i].busyAll = true;
      //    }
      //  }
      //   });
      });

    notifyListeners();
}

// bool isEmployeeStartedWork(int i , int j){
//    int hourFrom =  int.parse(employeeSchedule[i].workFrom!.substring(0,2));
//    int minFrom =  int.parse(employeeSchedule[i].workFrom!.substring(2,4));
//    int hourTo =  int.parse(employeeSchedule[i].workTo!.substring(0,2));
//    int minTo =  int.parse(employeeSchedule[i].workTo!.substring(2,4));
//
//    int currentHour =  int.parse(timeOpening[j].substring(0,2));
//    int currentMin =  int.parse(timeOpening[j].substring(2,4));
//
//    bool startedWork = hourFrom==currentH
//
//
// }



Future getSchedule2({String? date})async{
    var data = await repo.getSchedule(date:  date);
   if(data!=false){
     employeeSchedule = List.from(data.map((e)=>EmployeesTimeModel.fromJson(e)));
     employeeSchedule.forEach((element) {
       element.timeWorking = getTime(element).toList();
       print(element.timeWorking);
     });





   }
   notifyListeners();
}

  Iterable<String> getTime(EmployeesTimeModel employeesTimeModel)sync*{
    int hourFrom =  int.parse(employeesTimeModel.workFrom!.substring(0,2));
    int minFrom =  int.parse(employeesTimeModel.workFrom!.substring(3,5));
    int hourTo =  int.parse(employeesTimeModel.workTo!.substring(0,2));
    int minTo =  int.parse(employeesTimeModel.workTo!.substring(3,5));
    do {
      // TimeOfDay time = TimeOfDay(hour: hourFrom, minute: minFrom);
      String returningHour = '';
      String returningMinute = '';
      hourFrom<10? returningHour = '0$hourFrom': returningHour = hourFrom.toString();
      minFrom<10? returningMinute = '0$minFrom': returningMinute = minFrom.toString();
      yield '$returningHour:$returningMinute';
      minFrom += 30;
      while (minFrom >= 60) {
        minFrom -= 60;
        hourFrom++;
      }
    } while (hourFrom < hourTo ||
        (hourFrom == hourTo && minFrom <= minTo));

}


setDate(DateTime chosenDate){
date = DateFormat('EEEE').format(chosenDate).toString()+ '  '+
    chosenDate.toString().substring(0,10);
dateTime = chosenDate;

print(date);
print(dateTime);
getSchedule2(date: dateTime.toString().substring(0,10));
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