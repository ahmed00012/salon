
import 'package:beauty_center/models/categories0_model.dart';
import 'package:beauty_center/repository/orders_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/order_model.dart';


final reservationFuture =
ChangeNotifierProvider.autoDispose<ReservationProvider>((ref) => ReservationProvider());
class ReservationProvider extends ChangeNotifier {

  OrdersRepo repo = OrdersRepo();

List<OrderModel> orders = [];


  ReservationProvider(){
    getReservations();
  }




Future  getReservations()async{
   var data = await repo.getOrders();
   if(data!=false){
     orders = List.from(data.map((e)=>OrderModel.fromJson(e)));
   }
   notifyListeners();
  }

Future cancelOrder(String orderId)async{

    var data = await repo.cancelOrder(orderId);
    if(data!=false){
      orders.removeWhere((element) => element.id == orderId);
    }
    notifyListeners();
}


}