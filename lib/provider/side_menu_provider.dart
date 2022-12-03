

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final sideMenuFuture =
ChangeNotifierProvider.autoDispose<SideMenuProvider>((ref) => SideMenuProvider());
class SideMenuProvider extends ChangeNotifier {




SideMenuProvider(){

  }



}