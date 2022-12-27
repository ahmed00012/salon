
import 'package:beauty_center/models/categories0_model.dart';
import 'package:beauty_center/repository/orders_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/reservation_model.dart';

final reservationFuture =
ChangeNotifierProvider.autoDispose<ReservationProvider>((ref) => ReservationProvider());
class ReservationProvider extends ChangeNotifier {

  OrdersRepo repo = OrdersRepo();
List<ReservationModel> reservations = [];


  ReservationProvider(){
    getReservations2();
  }

  getReservations(){
    reservations = [
      ReservationModel(
        inSalon: true,
        employeeName: 'Maha',
        clientName: 'Bassant',
        createdAt: '09:15 PM',
        orderNumber: 1254,
        totalPayment: '300',
          clientPhone: '0123456789',

        services: [
          CategoriesModel0(
            name: 'Cut Hair',
            price: 100
          ),
          CategoriesModel0(
              name: 'Protine',
              price: 200
          ),
        ]

      ),
      ReservationModel(
        inSalon: true,
        clientName: 'Maha',
          employeeName: 'Bassant',
          clientPhone: '0123456789',
        createdAt: '08:37 PM',
        orderNumber: 1421,
        totalPayment: '400',
        services: [
          CategoriesModel0(
            name: 'Cut Hair',
            price: 100
          ),
          CategoriesModel0(
              name: 'Nails',
              price: 300
          ),
        ]

      ),
      ReservationModel(
        inSalon: false,
        clientName: 'Abeer',
          employeeName: 'Maha',
        createdAt: '04:01 PM',
        orderNumber: 6587,
        totalPayment: '300',
        clientPhone: '0123456789',
        services: [
          CategoriesModel0(
            name: 'Cut Hair',
            price: 100
          ),
          CategoriesModel0(
              name: 'Spa',
              price: 200
          ),
        ]

      ),
    ];
  }
Future  getReservations2()async{
   var data = await repo.getOrders();
  }




}