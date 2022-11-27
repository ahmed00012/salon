import 'package:flutter/material.dart';

import 'categories_model.dart';

class ReservationModel{
  TimeOfDay? timeStart;
  TimeOfDay? timeEnd;
  bool? inSalon;
  Duration? duration;
  String? clientName;
  int? orderNumber;
  List<CategoriesModel>? services;
  String? createdAt;
  String? totalPayment;



  ReservationModel({this.inSalon,this.timeEnd,this.timeStart,this.duration,this.services,this.clientName,this.createdAt,
  this.orderNumber,this.totalPayment});
}