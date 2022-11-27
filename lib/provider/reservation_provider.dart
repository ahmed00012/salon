
import 'package:beauty_center/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/reservation_model.dart';

final reservationFuture =
ChangeNotifierProvider.autoDispose<ReservationProvider>((ref) => ReservationProvider());
class ReservationProvider extends ChangeNotifier {

List<ReservationModel> reservations = [];


  ReservationProvider(){
    getReservations();
  }

  getReservations(){
    reservations = [
      ReservationModel(
        inSalon: true,
        clientName: 'Bassant',
        createdAt: '09:15 PM',
        orderNumber: 1254,
        totalPayment: '300',
        services: [
          CategoriesModel(
            name: 'Cut Hair',
            price: 100
          ),
          CategoriesModel(
              name: 'Protine',
              price: 200
          ),
        ]

      ),
      ReservationModel(
        inSalon: true,
        clientName: 'Maha',
        createdAt: '08:37 PM',
        orderNumber: 1421,
        totalPayment: '400',
        services: [
          CategoriesModel(
            name: 'Cut Hair',
            price: 100
          ),
          CategoriesModel(
              name: 'Nails',
              price: 300
          ),
        ]

      ),
      ReservationModel(
        inSalon: false,
        clientName: 'Abeer',
        createdAt: '04:01 PM',
        orderNumber: 6587,
        totalPayment: '300',
        services: [
          CategoriesModel(
            name: 'Cut Hair',
            price: 100
          ),
          CategoriesModel(
              name: 'Spa',
              price: 200
          ),
        ]

      ),
    ];
  }


}