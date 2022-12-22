import 'package:flutter/material.dart';

import 'categories0_model.dart';

class ReservationModel{
  TimeOfDay? timeStart;
  TimeOfDay? timeEnd;
  bool? inSalon;
  Duration? duration;
  String? clientName;
  String? clientPhone;
  int? orderNumber;
  List<CategoriesModel0>? services;
  String? createdAt;
  String? totalPayment;
  String? employeeName;



  ReservationModel({this.inSalon,this.timeEnd,this.timeStart,this.duration,this.services,this.clientName,this.createdAt,
  this.orderNumber,this.totalPayment,this.employeeName,this.clientPhone});
}