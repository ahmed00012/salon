import 'package:flutter/material.dart';

class EmployeeTime{
  TimeOfDay? hour;
  bool? halfAbove;
  bool? halfBottom;
  bool? busyAll;
  bool? free;
  bool? inSalon;
  bool? onBreak;
  EmployeeTime({this.halfAbove,this.hour,this.busyAll,this.halfBottom,this.inSalon,this.free,this.onBreak});
}