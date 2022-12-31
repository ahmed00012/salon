
import 'package:beauty_center/view/ui/choose_tybe.dart';
import 'package:beauty_center/view/ui/home_screen.dart';
import 'package:beauty_center/view/widgets/bottom_nav.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'local_storage.dart';



final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ZCOOLXiaoWei',
      ),
      home:  LocalStorage.getData(key: 'token')==null?
      ChooseTypeScreen():BottomNavBar(),
    );
  }
}


