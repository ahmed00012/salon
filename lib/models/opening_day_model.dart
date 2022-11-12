import 'package:flutter/material.dart';

class OpeningDayModel{
  int? id;
  String? day;
  TimeOfDay ?opening;
  TimeOfDay ?closing;
  bool? choosed;
  OpeningDayModel({this.id,this.closing,this.day,this.opening,this.choosed});
}