import 'package:flutter/material.dart';

class ReservationModel{
  TimeOfDay? timeStart;
  TimeOfDay? timeEnd;
  bool? inSalon;
  ReservationModel({this.inSalon,this.timeEnd,this.timeStart});
}