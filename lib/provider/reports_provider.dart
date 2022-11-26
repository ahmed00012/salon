
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/reports_model.dart';

final reportsFuture =
ChangeNotifierProvider.autoDispose<ReportsProvider>((ref) => ReportsProvider());
class ReportsProvider extends ChangeNotifier {
  String date = DateFormat('EEEE').format(DateTime.now()).toString()+ '  '+
      DateTime.now().toString().substring(0,10);
  DateTime dateTime = DateTime.now();
  List<ReportsModel> reports = [];

  ReportsProvider(){
    getReports();
  }

getReports(){
    reports = List<ReportsModel>.generate(9,(counter) =>ReportsModel(
 key: 'Loreum Ipsum',
      value: '15 EGP'
    ));
}


  setDate(DateTime chosenDate){
    date = DateFormat('EEEE').format(chosenDate).toString()+ '  '+
        chosenDate.toString().substring(0,10);
    dateTime = chosenDate;
    print(date);
    notifyListeners();
  }
}