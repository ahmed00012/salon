import 'dart:async';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/ui/salon_edit/time_opening_edit.dart';
import 'package:beauty_center/view/widgets/app_bar.dart';
import 'package:beauty_center/view/widgets/default_text_field.dart';
import 'package:beauty_center/view/widgets/horizontal_progress.dart';
import 'package:beauty_center/view/widgets/vertical_progress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../provider/edit_info_provider.dart';

class CenterInfoEdit extends ConsumerWidget {
  Completer<GoogleMapController> googleMapController = Completer();
  final _formKey = GlobalKey<FormState>();
  FocusNode titleEnglishFocusNode = new FocusNode();
  FocusNode titleArabicFocusNode = new FocusNode();
  FocusNode phone1FocusNode = new FocusNode();
  FocusNode phone2FocusNode = new FocusNode();
  FocusNode streetFocusNode = new FocusNode();
  FocusNode desArFocusNode = new FocusNode();
  FocusNode desEnFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(editInfoFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          MyAppBar(
            title: 'Salon Information',
          ),

          StatefulBuilder(
            builder: (context,setState) {
              return Form(
                key:_formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SizedBox(height: 15,),
                      Container(
                        width: width*0.9,
                        child: TextFormField(
                          controller: controller.titleEnController,
                          focusNode: titleEnglishFocusNode,
                          cursorColor: Constants.mainColor2,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    width: 1, color: Constants.mainColor2),
                              ),
                              labelText: 'Salon Title English',
                              labelStyle: TextStyle(color:titleEnglishFocusNode.hasFocus ?
                              Constants.mainColor2:Colors.black45,
                                  fontWeight: FontWeight.bold,fontSize: 14),
                              prefixIcon:Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset('assets/images/title(3).png' ,width: 5,color: Constants.mainColor2,),
                              ),
                          ),

                          validator: (val){
                            if (val!.length<2)
                              return 'Title must be 2 characters at least';
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: TextFormField(
                          controller: controller.titleArController,
                          focusNode: titleArabicFocusNode,
                          cursorColor: Constants.mainColor2,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                            focusedBorder:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Constants.mainColor2),
                            ),
                            labelText: 'Salon Title English',
                            labelStyle: TextStyle(color:titleArabicFocusNode.hasFocus ?
                            Constants.mainColor2:Colors.black45,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/title(3).png' ,width: 5,color: Constants.mainColor2,),
                        ),
                          ),

                          validator: (val){
                            if (val!.length<2)
                              return 'Title must be 2 characters at least';
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: TextFormField(
                          controller: controller.phoneController,
                          focusNode: phone1FocusNode,
                          cursorColor: Constants.mainColor2,
                          keyboardType:TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                            focusedBorder:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Constants.mainColor2),
                            ),
                            labelText: 'Salon Phone',
                            labelStyle: TextStyle(color:phone1FocusNode.hasFocus ?
                            Constants.mainColor2:Colors.black45,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon:Icon(Icons.phone,
                                color: Constants.mainColor2),
                          ),

                          validator: (val){
                            if (val!.length<10)
                              return 'Please Enter Valid Phone';
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: TextFormField(
                          controller: controller.anotherPhoneController,
                          focusNode: phone2FocusNode,
                          cursorColor: Constants.mainColor2,
                          keyboardType:TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                            focusedBorder:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Constants.mainColor2),
                            ),
                            labelText: 'Another Phone',
                            labelStyle: TextStyle(color:phone2FocusNode.hasFocus ?
                            Constants.mainColor2:Colors.black45,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon:Icon(Icons.phone,
                                color: Constants.mainColor2),
                          ),

                          validator: (val){
                            if (val!.length<10)
                              return 'Please Enter Valid Phone';
                          },
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'COUNTRY',
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          items: controller.countries
                              .map((item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: InkWell(
                              onTap: () {
                                controller.selectCountry(item);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.local_airport,
                                    color: Constants.mainColor2,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    item.title!.en!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ))
                              .toList(),
                          value: controller.countryValue,
                          onChanged: (value) {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Constants.mainColor2,
                          ),
                          iconSize: 14,
                          buttonHeight: height * 0.07,
                          buttonWidth: width*0.9,
                          buttonPadding:
                          const EdgeInsets.only(left: 5, right: 14),
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38)),
                          buttonElevation: 0,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          dropdownElevation: 0,
                          offset: const Offset(0, -5),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'CITY',
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          items: controller.cities
                              .map((item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: Constants.mainColor2,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  item.title!.en!,
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
                          onChanged: (value) {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Constants.mainColor2,
                          ),
                          iconSize: 14,
                          buttonHeight: height * 0.07,
                          buttonWidth: width*0.9,
                          buttonPadding:
                          const EdgeInsets.only(left: 5, right: 14),
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38)),
                          buttonElevation: 0,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          dropdownElevation: 0,
                          offset: const Offset(0, -5),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'AREA',
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          items: controller.areas
                              .map((item) => DropdownMenuItem<int>(
                            value: item.id,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_sharp,
                                  color: Constants.mainColor2,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  item.title!.en!,
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
                          onChanged: (value) {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Constants.mainColor2,
                          ),
                          iconSize: 14,
                          buttonHeight: height * 0.07,
                          buttonWidth: width*0.9,
                          buttonPadding:
                          const EdgeInsets.only(left: 5, right: 14),
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38)),
                          buttonElevation: 0,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          dropdownElevation: 0,
                          offset: const Offset(0, -5),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: TextFormField(
                          controller: controller.streetController,
                          focusNode: streetFocusNode,
                          cursorColor: Constants.mainColor2,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                            focusedBorder:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Constants.mainColor2),
                            ),
                            labelText: 'Street Name',
                            labelStyle: TextStyle(color:streetFocusNode.hasFocus ?
                            Constants.mainColor2:Colors.black45,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon:Icon(Icons.comment,
                                color: Constants.mainColor2),
                          ),


                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: TextFormField(
                          controller: controller.descriptionEnController,
                          focusNode: desEnFocusNode,
                          cursorColor: Constants.mainColor2,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                            focusedBorder:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Constants.mainColor2),
                            ),
                            labelText: 'Description English',
                            labelStyle: TextStyle(color:desEnFocusNode.hasFocus ?
                            Constants.mainColor2:Colors.black45,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon:Icon(Icons.person_pin_outlined,
                                color: Constants.mainColor2),
                          ),
                          validator: (val){
                            if(val!.length<10)
                              return 'Description Too Short';
                          },


                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: TextFormField(
                          controller: controller.descriptionArController,
                          focusNode: desArFocusNode,
                          cursorColor: Constants.mainColor2,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                            focusedBorder:const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  width: 1, color: Constants.mainColor2),
                            ),
                            labelText: 'Description Arabic',
                            labelStyle: TextStyle(color:desArFocusNode.hasFocus ?
                            Constants.mainColor2:Colors.black45,
                                fontWeight: FontWeight.bold,fontSize: 14),
                            prefixIcon:Icon(Icons.person_pin_outlined,
                                color: Constants.mainColor2),
                          ),
                          validator: (val){
                            if(val!.length<10)
                              return 'Description Too Short';
                          },


                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: InkWell(
                          onTap: () {
                            controller.determinePosition(googleMapController);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.my_location_outlined,
                                color: Constants.mainColor2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Use Your Current Location',
                                style: TextStyle(
                                    color: Constants.mainColor2,
                                    fontSize: height * 0.018),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width*0.9,
                        child: Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('OR Pick Your Location',
                                  style: TextStyle(color: Colors.black38)),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: height * 0.4,
                        width: width*0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            onTap: (latLng) {
                              controller.addMarker(latLng);
                            },
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  30.044611387091066, 31.231687873506743),
                              zoom: controller.zoom,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              googleMapController.complete(controller);
                            },
                            gestureRecognizers: Set()
                              ..add(Factory<PanGestureRecognizer>(
                                      () => PanGestureRecognizer())),
                            markers: Set<Marker>.of(controller.markers),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Constants.mainColor2),
                          child: Center(
                            child: Text(
                              'Done',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
