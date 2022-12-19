


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/categories0_model.dart';

final makeReservationFuture =
ChangeNotifierProvider.autoDispose<MakeReservationProvider>((ref) => MakeReservationProvider());
class MakeReservationProvider extends ChangeNotifier {
  List<CategoriesModel0> categories=[];

  MakeReservationProvider(){
    getCategories();
  }


  getCategories(){
    categories = [
      CategoriesModel0(
          id: 1,
          name: 'Hair',
          choose: false,
          subcategory: [
            CategoriesModel0(name: 'cut',choose: false,inHome: false,inSalon: false),
            CategoriesModel0(name: 'straight',choose: false,inHome: false,inSalon: false),
            CategoriesModel0(name:  'iron',choose: false,inHome: false,inSalon: false),
            CategoriesModel0(name: 'burn',choose: false,inHome: false,inSalon: false),
          ]
      ),
      CategoriesModel0(
          id: 2,
          name: 'face',
          choose: false,
          subcategory: [
            CategoriesModel0(name: 'mask',choose: false,inHome: false,inSalon: false),
            CategoriesModel0(name: 'hot towel',choose: false,inHome: false,inSalon: false),
            CategoriesModel0(name: 'clean',choose: false,inHome: false,inSalon: false),
            CategoriesModel0(name: 'remove hair',choose: false,inHome: false,inSalon: false),
          ]
      ),
      CategoriesModel0(
          id: 3,
          name: 'fingernails',
          choose: false,
          subcategory: [
            CategoriesModel0(name: 'cut',choose: false,inHome: false,inSalon: false),

          ]
      )
    ];
  }


  chooseCategory(int i,int j){
    categories[i].subcategory![j].choose = !categories[i].subcategory![j].choose!;
    notifyListeners();
  }


}