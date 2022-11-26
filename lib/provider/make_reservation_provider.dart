


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/categories_model.dart';

final makeReservationFuture =
ChangeNotifierProvider.autoDispose<MakeReservationProvider>((ref) => MakeReservationProvider());
class MakeReservationProvider extends ChangeNotifier {
  List<CategoriesModel> categories=[];

  MakeReservationProvider(){
    getCategories();
  }


  getCategories(){
    categories = [
      CategoriesModel(
          id: 1,
          name: 'Hair',
          choose: false,
          subcategory: [
            CategoriesModel(name: 'cut',choose: false,inHome: false,inSalon: false),
            CategoriesModel(name: 'straight',choose: false,inHome: false,inSalon: false),
            CategoriesModel(name:  'iron',choose: false,inHome: false,inSalon: false),
            CategoriesModel(name: 'burn',choose: false,inHome: false,inSalon: false),
          ]
      ),
      CategoriesModel(
          id: 2,
          name: 'face',
          choose: false,
          subcategory: [
            CategoriesModel(name: 'mask',choose: false,inHome: false,inSalon: false),
            CategoriesModel(name: 'hot towel',choose: false,inHome: false,inSalon: false),
            CategoriesModel(name: 'clean',choose: false,inHome: false,inSalon: false),
            CategoriesModel(name: 'remove hair',choose: false,inHome: false,inSalon: false),
          ]
      ),
      CategoriesModel(
          id: 3,
          name: 'fingernails',
          choose: false,
          subcategory: [
            CategoriesModel(name: 'cut',choose: false,inHome: false,inSalon: false),

          ]
      )
    ];
  }


  chooseCategory(int i,int j){
    categories[i].subcategory![j].choose = !categories[i].subcategory![j].choose!;
    notifyListeners();
  }


}