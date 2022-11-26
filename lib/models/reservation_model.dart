import 'package:flutter/material.dart';

class ReservationModel{
  TimeOfDay? timeStart;
  TimeOfDay? timeEnd;
  bool? inSalon;
  Duration? duration;


  ReservationModel({this.inSalon,this.timeEnd,this.timeStart,this.duration});
}