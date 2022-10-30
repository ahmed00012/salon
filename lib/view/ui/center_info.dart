

import 'dart:async';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/widgets/app_bar.dart';
import 'package:beauty_center/view/widgets/horizontal_progress.dart';
import 'package:beauty_center/view/widgets/vertical_progress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../provider/center_registration_provider.dart';

class CenterInfo extends ConsumerWidget {
  bool nameFocus = false;
  bool phoneFocus = false;
  bool secondPhoneFocus = false;
  bool countryFocus = false;
  bool cityFocus = false;
  bool areaFocus = false;
  bool streetFocus = false;
  Completer<GoogleMapController> googleMapController = Completer();


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(title: 'Salon Information',),
         HorizontalProgress(),
          SizedBox(height: 20,),
         Expanded(
           child: StatefulBuilder(

               builder: (context,setState){


             return Row(
               crossAxisAlignment: CrossAxisAlignment.start,

               children: [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: ListView(


                       children: [
                         Container(

                           decoration: BoxDecoration(
                             color:  Colors.white,
                             borderRadius: BorderRadius.circular(10),

                           ),
                           child: FocusScope(
                             child: Focus(
                               onFocusChange: (focus) {
                                 setState((){
                                   nameFocus = focus;
                                 });
                                 print(nameFocus.toString()+'flflfl');

                               },
                               child: TextFormField(
                                 cursorColor: Constants.mainColor2,
                                 decoration: InputDecoration(
                                     border: InputBorder.none,
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.all(Radius.circular(8)),
                                       borderSide: BorderSide(
                                           width: 1, color: Constants.mainColor2),
                                     ),
                                     label: Text(
                                         'SALON NAME',
                                    style:   TextStyle(color:nameFocus?
                                       Constants.mainColor2:Colors.black26,
                                           fontWeight: FontWeight.bold,fontSize: 14),
                                     ),

                                     prefixIcon: Padding(
                                       padding: const EdgeInsets.only(right: 10),
                                       child: Icon(Icons.person,
                                           color: Constants.mainColor2),
                                     )
                                 ),

                               ),
                             ),
                           ),
                         ),
                         SizedBox(height: 20,),
                         Container(

                           decoration: BoxDecoration(
                             color:  Colors.white,
                             borderRadius: BorderRadius.circular(10),

                           ),
                           child: FocusScope(
                             child: Focus(
                               onFocusChange: (focus) {
                                 setState((){
                                   phoneFocus = focus;
                                 });
                               },
                               child: TextFormField(
                                 cursorColor: Constants.mainColor2,
                                 decoration: InputDecoration(
                                     border: InputBorder.none,
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.all(Radius.circular(8)),
                                       borderSide: BorderSide(
                                           width: 1, color: Constants.mainColor2),
                                     ),
                                     labelText: 'SALON PHONE',
                                     labelStyle: TextStyle(color:phoneFocus?
                                     Constants.mainColor2:Colors.black26,
                                         fontWeight: FontWeight.bold,fontSize: 14),
                                     prefixIcon: Padding(
                                       padding: const EdgeInsets.only(right: 10),
                                       child: Icon(Icons.phone,
                                           color: Constants.mainColor2),
                                     )
                                 ),

                               ),
                             ),
                           ),
                         ),
                         SizedBox(height: 20,),
                         Container(

                           decoration: BoxDecoration(
                             color:  Colors.white,
                             borderRadius: BorderRadius.circular(10),

                           ),
                           child: FocusScope(
                             child: Focus(
                               onFocusChange: (focus) {
                                 setState((){
                                   secondPhoneFocus = focus;
                                 });
                               },
                               child: TextFormField(
                                 cursorColor: Constants.mainColor2,
                                 decoration: InputDecoration(
                                     border: InputBorder.none,
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.all(Radius.circular(8)),
                                       borderSide: BorderSide(
                                           width: 1, color: Constants.mainColor2),
                                     ),
                                     labelText: 'ANOTHER PHONE',
                                     labelStyle: TextStyle(color:secondPhoneFocus?
                                     Constants.mainColor2:Colors.black26,
                                         fontWeight: FontWeight.bold,fontSize: 14),
                                     prefixIcon: Padding(
                                       padding: const EdgeInsets.only(right: 10),
                                       child: Icon(Icons.phone,
                                           color: Constants.mainColor2),
                                     )
                                 ),

                               ),
                             ),
                           ),
                         ),
                         SizedBox(height: 20,),
                         Text('COUNTRY',style: TextStyle(
                           color: Colors.black26,
                           fontWeight: FontWeight.bold
                         ),),
                         SizedBox(height: 10,),
                         DropdownButtonHideUnderline(
                           child: DropdownButton2(


                             items: controller.countries
                                 .map((item) =>
                                 DropdownMenuItem<String>(
                                   value: item,
                                   child: Row(
                                     children: [
                                       Icon(Icons.local_airport,color: Constants.mainColor2,),
                                       SizedBox(width: 10,),
                                       Text(
                                         item,
                                         style: const TextStyle(
                                           fontSize: 14,

                                           color: Colors.black,
                                         ),
                                         overflow: TextOverflow.ellipsis,
                                       )
                                     ],
                                   ),
                                 ))
                                 .toList(),
                             value: controller.countryValue,
                             onChanged: (value) {
                               setState(() {
                                 controller.countryValue = value as String;
                               });
                             },

                             icon: const Icon(
                               Icons.arrow_forward_ios_outlined,
                               color: Constants.mainColor2,
                             ),
                             onMenuStateChange: (opened){
                               setState((){
                                 countryFocus = opened;
                               });
                             },
                             iconSize: 14,

                             buttonHeight: height*0.06,

                             buttonPadding: const EdgeInsets.only(left: 5, right: 14),
                             buttonDecoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.white,
                               border: Border.all(
                                 color: countryFocus?Constants.mainColor2:Colors.white
                               )


                             ),
                             buttonElevation: 0,
                             dropdownDecoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.white,
                             ),
                             dropdownElevation: 0,
                             offset: const Offset(0, -5),
                           ),
                         ),
                         SizedBox(height: 20,),
                         Text('CITY',style: TextStyle(
                             color: Colors.black26,
                             fontWeight: FontWeight.bold
                         ),),
                         SizedBox(height: 10,),
                         DropdownButtonHideUnderline(
                           child: DropdownButton2(


                             items: controller.cities
                                 .map((item) =>
                                 DropdownMenuItem<String>(
                                   value: item,
                                   child: Row(
                                     children: [
                                       Icon(Icons.location_city,color: Constants.mainColor2,),
                                       SizedBox(width: 10,),
                                       Text(
                                         item,
                                         style: const TextStyle(
                                           fontSize: 14,

                                           color: Colors.black,
                                         ),
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                     ],
                                   ),
                                 ))
                                 .toList(),
                             value: controller.cityValue,
                             onChanged: (value) {
                               setState(() {
                                 controller.cityValue = value as String;
                               });
                             },
                             icon: const Icon(
                               Icons.arrow_forward_ios_outlined,
                               color: Constants.mainColor2,
                             ),
                             onMenuStateChange: (opened){
                               setState((){
                                 cityFocus = opened;
                               });
                             },
                             iconSize: 14,

                             buttonHeight: height*0.06,

                             buttonPadding: const EdgeInsets.only(left: 5, right: 14),
                             buttonDecoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.white,
                                 border: Border.all(
                                     color: cityFocus?Constants.mainColor2:Colors.white
                                 )


                             ),
                             buttonElevation: 0,
                             dropdownDecoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.white,
                             ),
                             dropdownElevation: 0,
                             offset: const Offset(0, -5),
                           ),
                         ),
                         SizedBox(height: 20,),
                         Text('AREA',style: TextStyle(
                             color: Colors.black26,
                             fontWeight: FontWeight.bold
                         ),),
                         SizedBox(height: 10,),
                         DropdownButtonHideUnderline(
                           child: DropdownButton2(


                             items: controller.areas
                                 .map((item) =>
                                 DropdownMenuItem<String>(
                                   value: item,
                                   child: Row(
                                     children: [
                                       Icon(Icons.location_on_sharp,color: Constants.mainColor2,),
                                       SizedBox(width: 10,),
                                       Text(
                                         item,
                                         style: const TextStyle(
                                           fontSize: 14,

                                           color: Colors.black,
                                         ),
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                     ],
                                   ),
                                 ))
                                 .toList(),
                             value: controller.areaValue,
                             onChanged: (value) {
                               setState(() {
                                 controller.areaValue = value as String;
                               });
                             },
                             icon: const Icon(
                               Icons.arrow_forward_ios_outlined,
                               color: Constants.mainColor2,
                             ),
                             onMenuStateChange: (opened){
                               setState((){
                                 areaFocus = opened;
                               });
                             },
                             iconSize: 14,

                             buttonHeight: height*0.06,

                             buttonPadding: const EdgeInsets.only(left: 5, right: 14),
                             buttonDecoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.white,
                                 border: Border.all(
                                     color: areaFocus?Constants.mainColor2:Colors.white
                                 )


                             ),
                             buttonElevation: 0,
                             dropdownDecoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.white,
                             ),
                             dropdownElevation: 0,
                             offset: const Offset(0, -5),
                           ),
                         ),
                         SizedBox(height: 20,),
                         Container(

                           decoration: BoxDecoration(
                             color:  Colors.white,
                             borderRadius: BorderRadius.circular(10),

                           ),
                           child: FocusScope(
                             child: Focus(
                               onFocusChange: (focus) {
                                 setState((){
                                   streetFocus = focus;
                                 });
                               },
                               child: TextFormField(
                                 cursorColor: Constants.mainColor2,
                                 decoration: InputDecoration(
                                     border: InputBorder.none,
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.all(Radius.circular(8)),
                                       borderSide: BorderSide(
                                           width: 1, color: Constants.mainColor2),
                                     ),
                                     labelText: 'STREET NAME',
                                     labelStyle: TextStyle(color:streetFocus?
                                     Constants.mainColor2:Colors.black26,
                                         fontWeight: FontWeight.bold,fontSize: 14),
                                     prefixIcon: Padding(
                                       padding: const EdgeInsets.only(right: 10),
                                       child: Icon(Icons.comment,
                                           color: Constants.mainColor2),
                                     )
                                 ),

                               ),
                             ),
                           ),
                         ),

                         Container(
                           height: height * 0.4,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15)),
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(15),
                             child: GoogleMap(
                               mapType: MapType.normal,

                               onTap: (latLng){
                                 controller.addMarker(latLng);
                               },
                               initialCameraPosition: CameraPosition(
                                 target:
                                 LatLng(30.044611387091066, 31.231687873506743),
                                 zoom: controller.zoom,
                               ),
                               onMapCreated: (GoogleMapController controller) {
                                 googleMapController.complete(controller);
                               },

                               markers: Set<Marker>.of(controller.markers),
                               gestureRecognizers: {
                                 Factory<OneSequenceGestureRecognizer>(
                                       () => EagerGestureRecognizer(),
                                 ),
                               },
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 VerticalProgress(height: height,progressHeight: height/2),
               ],
             );
           }),
         )
          
        ],
      ),
    );
  }
}
