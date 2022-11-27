


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/categories_model.dart';
import '../models/points_model.dart';

final pointsFuture =
ChangeNotifierProvider.autoDispose<PointsProvider>((ref) => PointsProvider());
class PointsProvider extends ChangeNotifier {
  PointsModel points = PointsModel();

  PointsProvider(){
getPoints();
  }


  getPoints(){
points = PointsModel(
  balance:400,
  limit:'200',
  pointsSum: 200,
  points: [

    Point(
      points:20,
      orderId:15,
      id: 1,
      isConverted: 0,
    ),
    Point(
      points:20,
      orderId:15,
      id: 1,
      isConverted: 0,
    ),
    Point(
      points:20,
      orderId:15,
      id: 1,
      isConverted: 0,
    ),
    Point(
      points:20,
      orderId:15,
      id: 1,
      isConverted: 0,
    ),
  ]

);
notifyListeners();
  }


}