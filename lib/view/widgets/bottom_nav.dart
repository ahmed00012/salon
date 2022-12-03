


import 'dart:io';
import 'package:beauty_center/view/ui/home_screen.dart';
import 'package:beauty_center/view/ui/points.dart';
import 'package:beauty_center/view/ui/reports_screen.dart';
import 'package:beauty_center/view/ui/reservations.dart';
import 'package:beauty_center/view/ui/side_menu_screen.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../ui/home_screen.dart';


class BottomNavBar extends StatefulWidget {
  int? index;
  BottomNavBar({this.index});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin
{
  int? currentTab =2;
 DateTime? currentBackPressTime;
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    _navigationController = CircularBottomNavigationController(currentTab);
    if(widget.index==null)
      currentTab = 2;
    else
      currentTab = widget.index;
   // fcmNotification();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
  List<TabItem> tabItems = List.of([
    TabItem(Icons.bar_chart_sharp, "Reports",  Constants.mainColor2, labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
    TabItem(Icons.account_balance_wallet, "Bonus", Constants.mainColor2, labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
    TabItem(Icons.home, "Home", Constants.mainColor2, labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
    TabItem(Icons.table_chart, "Reservations",Constants.mainColor2, labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 12)),
    TabItem(Icons.menu, "More",  Constants.mainColor2, labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),

  ]);

  Future<bool> onWillPop() {
    if(currentTab!=2) {
      setState(() {
        currentTab = 2;
      });
      return Future.value(false);
    } else
    {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        //Fluttertoast.showToast(msg: 'Double Tap To Exit');
        return Future.value(false);
      } else
        exit(0);
    }
  }
  @override
  Widget build(BuildContext context) {

    List<Widget> _screens = [
      ReportsScreen(),
      PointsScreen(),
      HomeScreen(),
      Reservations(),
      SideMenu()
    ];

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            _screens[currentTab!],
            Align(
              alignment: Alignment.bottomCenter,
              child: CircularBottomNavigation(

                tabItems,
                controller: _navigationController,
              //  animationDuration: Duration(milliseconds: 600),
                selectedPos: currentTab!,
                normalIconColor: Constants.mainColor2,
                barBackgroundColor: Colors.white,
                selectedCallback: (index) {
                  setState(() {
                    currentTab = index;
                    _navigationController.value = index;
                  });
                  //  print(provider.currentIndex.toString()+'dkfbdifudbfiub');
                },


              ),
            )
          ],
        ),
      ),
    );
  }





}





//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:loz/presentation/screens/favorite.dart';
// import 'package:loz/presentation/screens/orders.dart';
// import 'package:loz/presentation/screens/menu.dart';
// import 'package:loz/theme.dart';
//
//
//
// import 'home.dart';
//
// class NavBar extends StatefulWidget {
//   NavBar({Key? key,this.animationController}) : super(key: key);
//   final AnimationController? animationController;
//
//
//   @override
//   _NavBarState createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> with TickerProviderStateMixin{
//   double rateShop = 3;
//   double rateFood = 3;
//   int? shopId;
//   int? productId;
//   int current =0;
//   AnimationController? animationController;
//
//
//   Widget tabBody = Container(
//     color: FitnessAppTheme.background,
//   );
//
//

//
//
//   // fcmNotification() {
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     RemoteNotification? notification = message.notification;
//   //     AndroidNotification? android = message.notification?.android;
//   //     if (notification != null && android != null) {
//   //       flutterLocalNotificationsPlugin.show(
//   //           notification.hashCode,
//   //           notification.title,
//   //           notification.body ?? "",
//   //           NotificationDetails(
//   //             android: AndroidNotificationDetails(
//   //               notification.title ?? "",
//   //               notification.body ?? "",
//   //               // TODO add a proper drawable resource to android, for now using
//   //               //      one that already exists in example app.
//   //               icon: '@mipmap/ic_launcher',
//   //             ),
//   //           ));
//   //       print(message.data['status'].toString() + "jjjjjjjjjjj");
//   //
//   //       showSimpleNotification(
//   //         GestureDetector(
//   //           onTap: () {
//   //             String? status;
//   //             status = message.data['status'];
//   //
//   //             print(status.toString() + "kkkkk");
//   //             if (status == "3" || status == "4") {
//   //               Navigator.of(context).push(
//   //                   MaterialPageRoute(builder: (context) => HistoryScreen()));
//   //             } else if (status == "1" || status == "2") {
//   //               Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //                   builder: (context) => NavBar(
//   //                     id: 2,
//   //                   )));
//   //             } else
//   //               Navigator.of(context).push(
//   //                   MaterialPageRoute(builder: (context) => NotifyScreen()));
//   //             // if(message.notification!.title == "تم تحديث حالة طلبك") {
//   //             //   if (message.notification!.body == "تم تسليم الطلب"||message.notification!.body == "Order has been delivered")
//   //             //     Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //             //         builder: (context) => HistoryScreen()));
//   //             //   else if (message.notification!.body == "طلبك ملغى")
//   //             //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryScreen()));
//   //             //   else
//   //             //   Navigator.of(context).pushReplacement(
//   //             //       MaterialPageRoute(builder: (context) => NavBar(id: 2,)));
//   //             // } else
//   //             //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotifyScreen()));
//   //           },
//   //           child: Container(
//   //             height: 80,
//   //             width: MediaQuery.of(context).size.width,
//   //             child: Padding(
//   //                 padding: const EdgeInsets.only(top: 5.0),
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.center,
//   //                   children: [
//   //                     Padding(
//   //                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//   //                       child: SizedBox(
//   //                         width: MediaQuery.of(context).size.width,
//   //                         child: Text(
//   //                           message.notification!.title!,
//   //                           textAlign: TextAlign.center,
//   //                           style: TextStyle(
//   //                               overflow: TextOverflow.ellipsis,
//   //                               color: Colors.white,
//   //                               fontSize: 16,
//   //                               fontWeight: FontWeight.bold),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 5,
//   //                     ),
//   //                     Padding(
//   //                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//   //                       child: SizedBox(
//   //                         width: MediaQuery.of(context).size.width,
//   //                         child: Text(
//   //                           _parseHtmlString(message.notification!.body!),
//   //                           textAlign: TextAlign.center,
//   //                           style: TextStyle(
//   //                               color: Colors.white,
//   //                               fontSize: 16,
//   //                               overflow: TextOverflow.ellipsis,
//   //                               fontWeight: FontWeight.bold),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 )),
//   //           ),
//   //         ),
//   //         duration: Duration(seconds: 5),
//   //         elevation: 0.0,
//   //         background: kColorYellow,
//   //       );
//   //     }
//   //     if (message.data['status'] == "3") {
//   //       // print("kkhhhhhhhhhhhhh${message.data['shop']}");
//   //       _showRatingDialog(
//   //           context, message.data['shop'], message.data['product']);
//   //     }
//   //   });
//   //   // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   //   //   print('A new onMessageOpenedApp event was published!');
//   //   //   RemoteNotification? notification = message.notification;
//   //   //   AndroidNotification? android = message.notification?.android;
//   //   //   if (notification != null && android != null) {
//   //   //     showDialog(
//   //   //         context: context,
//   //   //         builder: (_) {
//   //   //           return AlertDialog(
//   //   //             title: Text(notification.title??""),
//   //   //             content: SingleChildScrollView(
//   //   //               child: Column(
//   //   //                 crossAxisAlignment: CrossAxisAlignment.start,
//   //   //                 children: [Text(notification.body??"")],
//   //   //               ),
//   //   //             ),
//   //   //           );
//   //   //         });
//   //   //   }
//   //   // });
//   //
//   //   // ديه بتفتح التطبيق وتقيم الخدمة
//   //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   //     print(
//   //         'A new onMessageOpenedApp event was published Message ${message.notification!.title} ');
//   //     String? status;
//   //     status = message.data['status'];
//   //
//   //     print(status.toString() + "kkkkk");
//   //     if (status == "3") {
//   //       Navigator.of(context).push(
//   //           MaterialPageRoute(builder: (context) => HistoryScreen()));
//   //       _showRatingDialog(
//   //           context, message.data['shop'], message.data['product']);
//   //     }
//   //     else if (status == "4") {
//   //       Navigator.of(context).push(
//   //           MaterialPageRoute(builder: (context) => HistoryScreen()));
//   //     }
//   //     else if (status == "1" || status == "2") {
//   //       Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //           builder: (context) => NavBar(
//   //             id: 2,
//   //           )));
//   //     } else
//   //       Navigator.of(context).push(
//   //           MaterialPageRoute(builder: (context) => NotifyScreen()));
//   //   });
//   //
//   //   // FirebaseMessaging.instance.getToken().then((value) {
//   //   //   print("FIREBASE TOKEN $value");
//   //   // });
//   // }
//
//   // Future<void> _submit(String shopId, String rateShop, String rateProduct,
//   //     String productId) async {
//   //   try {
//   //     print('0000000000000000000000000000');
//   //     LoadingScreen.show(context);
//   //     await ApiOrder.instance
//   //         .rateOrder(shopId, rateShop, rateProduct, productId);
//   //     Navigator.of(context).popUntil((route) => route.isFirst);
//   //     Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //         builder: (context) => NavBar(
//   //           id: 0,
//   //         )));
//   //   } on ApiException catch (_) {
//   //     print('ApiException');
//   //     Navigator.of(context).pop();
//   //     ServerConstants.showDialog1(context, _.toString());
//   //   } on DioError catch (e) {
//   //     //<<<<< IN THIS LINE
//   //     print(
//   //         "e.response.statusCode    ////////////////////////////         DioError");
//   //     if (e.response!.statusCode == 400) {
//   //       print(e.response!.statusCode);
//   //     } else {
//   //       print(e.message);
//   //       // print(e?.request);
//   //     }
//   //   } catch (e) {
//   //     print('catch');
//   //     print(e);
//   //
//   //     Navigator.of(context).pop();
//   //     ServerConstants.showDialog1(context, e.toString());
//   //   } finally {
//   //     if (mounted) setState(() {});
//   //   }
//   // }
//
//   String? token = '';
//   //
//   // void getToken() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   token = prefs.getString('access_token');
//   //   setState(() {});
//   // }
//
//   @override
//   void initState() {
//     animationController = AnimationController(
//         duration: const Duration(milliseconds: 600), vsync: this);
//     super.initState();
//
//     // fcmNotification();
//     // getToken();
//     //  widget.id=0;
//     // getToken();
//     //getData();
//   }
//
//
//   // final List<Widget> currentTab2 = [
//   //   HomeScreen(),
//   //   FavScreen(),
//   //   OrdersScreen(),
//   //   MenuScreenGeust()
//   // ];
//
//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//       context: context,
//       builder: (context) => new CupertinoAlertDialog(
//         title: new Text(
//           "LocaleKeys.exit_translate.tr()",
//           // CodegenLoader.exit.tr(),
//         ),
//         actions: <Widget>[
//           new FlatButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             child: new Text(
//              " LocaleKeys.no_translate.tr(),"
//             ),
//           ),
//           new FlatButton(
//             onPressed: () => Navigator.of(context).pop(true),
//             child: new Text(
//              " LocaleKeys.yes_translate.tr(),"
//             ),
//           ),
//         ],
//       ),
//     )) ??
//         false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> currentTab = [
//       HomeScreen(animationController:animationController ,),
//       FavoriteScreen(),
//       OrdersScreen(),
//       PointsScreen()
//     ];
//     // final provider = Provider.of<BottomNavBarProvider>(context);
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//           body:
//           //token != null
//               currentTab[0],
//               //: currentTab2[widget.id ?? 0],
//           bottomNavigationBar: Container(
//             height: 70,
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: GNav(
//                 rippleColor: Colors.grey,
//                 // tab button ripple color when pressed
//                 hoverColor: Colors.grey,
//                 // tab button hover color
//                 haptic: true,
//                 // haptic feedback
//                 tabBorderRadius: 20,
//                 //  tabActiveBorder: Border.all(color: kColorPrimary, width: 1), // tab button border
//                 //   tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
//                 // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
//                 //   curve: Curves.easeOutExpo, // tab animation curves
//                 //   duration: Duration(milliseconds: 1000), // tab animation duration
//                 gap: 6,
//                 // the tab button gap between icon and text
//                 color: Colors.grey,
//                 // unselected icon color
//                 activeColor: FitnessAppTheme.secondary,
//                 // selected icon and text color
//                 iconSize: 24,
//                 // tab button icon size
//                 tabBackgroundColor: FitnessAppTheme.secondary.withOpacity(.2),
//                 // selected tab background color
//                 padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//                 selectedIndex:  current,
//                 onTabChange: (index) {
//                   setState(() {
//                   current = index;
//                   });
//                 },
//                 // navigation bar padding
//                 tabs: [
//                   GButton(
//                     icon: Icons.home,
//                     text: "home",
//                   ),
//                   GButton(
//                     icon: Icons.favorite,
//                     text: "favorite",
//                   ),
//                   GButton(
//                     icon: Icons.shopping_cart,
//                     text: "orders"
//                   ),
//                   GButton(
//                     icon: Icons.more_horiz,
//                     text: "more",
//                   )
//                 ]),
//             // child: CustomNavigationBar(
//             //   iconSize: 30.0,
//             //   selectedColor: kColorPrimary,
//             //   strokeColor: Color(0x30040307),
//             //   unSelectedColor: Color(0xffacacac),
//             //   backgroundColor: Colors.white,
//             //   items: [
//             //     CustomNavigationBarItem(
//             //       icon: Icon(Icons.home),
//             //     //  title: Text("Home"),
//             //     ),
//             //     CustomNavigationBarItem(
//             //       icon: Icon(Icons.favorite_border),
//             //     //  title: const Text("Favorites"),
//             //     ),
//             //     CustomNavigationBarItem(
//             //       icon: const Icon(Icons.shopping_cart),
//             //  //     title: const Text("Cart"),
//             //     ),
//             //     CustomNavigationBarItem(
//             //       icon: const Icon(Icons.more_horiz),
//             //     //  title: const Text("More"),
//             //     ),
//             //     // CustomNavigationBarItem(
//             //     //   icon: Icon(Icons.lightbulb_outline),
//             //     //   title: Text("Explore"),
//             //     // ),
//             //     // CustomNavigationBarItem(
//             //     //   icon: Icon(Icons.search),
//             //     //   title: Text("Search"),
//             //     // ),
//             //     // CustomNavigationBarItem(
//             //     //   icon: Icon(Icons.account_circle),
//             //     //   title: Text("Me"),
//             //     // ),
//             //   ],
//             //   currentIndex: _currentIndex,
//             //   onTap: (index) {
//             //     setState(() {
//             //       _currentIndex = index;
//             //     });
//             //   },
//             // ),
//           )),
//     );
//   }
//
//   // Future _showRatingDialog(context, String shop, String product) async {
//   //   await showDialog<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         shape: RoundedRectangleBorder(
//   //             borderRadius: BorderRadius.all(Radius.circular(32.0))),
//   //         content: StatefulBuilder(
//   //           builder: (BuildContext context, StateSetter setState) {
//   //             return Form(
//   //               //   key: _key,
//   //               child: Column(
//   //                 crossAxisAlignment: CrossAxisAlignment.center,
//   //                 mainAxisSize: MainAxisSize.min,
//   //                 children: [
//   //                   Text(LocaleKeys.food_rate.tr()),
//   //                   Container(
//   //                       alignment: Alignment.center,
//   //                       margin: EdgeInsets.symmetric(vertical: 10),
//   //                       child: RatingBar.builder(
//   //                         initialRating: 3,
//   //                         minRating: 1,
//   //                         direction: Axis.horizontal,
//   //                         allowHalfRating: false,
//   //                         itemSize: 35,
//   //                         itemCount: 5,
//   //                         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//   //                         itemBuilder: (context, _) => Icon(
//   //                           Icons.star,
//   //                           color: Colors.amber,
//   //                         ),
//   //                         onRatingUpdate: (rating) {
//   //                           rateFood = rating;
//   //                           print(rateFood);
//   //                         },
//   //                       )),
//   //                   Text(LocaleKeys.shop_rate.tr()),
//   //                   Container(
//   //                       alignment: Alignment.center,
//   //                       margin: EdgeInsets.symmetric(vertical: 10),
//   //                       child: RatingBar.builder(
//   //                         initialRating: 3,
//   //                         minRating: 1,
//   //                         direction: Axis.horizontal,
//   //                         allowHalfRating: false,
//   //                         itemSize: 35,
//   //                         itemCount: 5,
//   //                         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//   //                         itemBuilder: (context, _) => Icon(
//   //                           Icons.star,
//   //                           color: Colors.amber,
//   //                         ),
//   //                         onRatingUpdate: (rating) {
//   //                           rateShop = rating;
//   //                           print(rateShop);
//   //                         },
//   //                       )),
//   //                   Container(
//   //                     padding: const EdgeInsets.only(
//   //                         right: 30.0, left: 30, bottom: 0, top: 20),
//   //                     child: SizedBox(
//   //                       height: 45,
//   //                       width: MediaQuery.of(context).size.width,
//   //                       child: TextButton(
//   //                         //    icon: Icon(Icons.star),
//   //                           style: TextButton.styleFrom(
//   //                             primary: Colors.white,
//   //                             backgroundColor: kColorPrimary,
//   //                             onSurface: Colors.grey,
//   //                           ),
//   //                           onPressed: () {
//   //                             _submit(shop, rateShop.toString(),
//   //                                 rateFood.toString(), product);
//   //                           },
//   //                           //launch("tel://012345677"),
//   //                           child: Text(
//   //                             LocaleKeys.send_translate.tr(),
//   //                             style: TextStyle(
//   //                                 fontWeight: FontWeight.bold, fontSize: 16),
//   //                           )),
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),
//   //             );
//   //           },
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//
// }
