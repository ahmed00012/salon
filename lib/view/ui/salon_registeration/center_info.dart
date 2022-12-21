import 'dart:async';

import 'package:beauty_center/constants.dart';
import 'package:beauty_center/view/ui/salon_registeration/time_opening_info.dart';
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

import '../../../provider/center_registration_provider1.dart';

class CenterInfo extends ConsumerWidget {
  Completer<GoogleMapController> googleMapController = Completer();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(registerFuture);
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            title: 'Salon Information',
          ),
          HorizontalProgress(
            index: 1,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StatefulBuilder(builder: (context, setState) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Form(
                        key:_formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                               DefaultTextField(
                                 label: 'Salon Title English',
                                 image: 'assets/images/title(3).png',
                                 controller: controller.titleEnController,
                                 validator: (val){
                                   if (val!.length<2)
                                     return 'Title must be 2 characters at least';
                                 },


                               ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultTextField(
                                label: 'Salon Title Arabic',
                                image: 'assets/images/title(3).png',
                                controller: controller.titleArController,
                                validator: (val){
                                  if (val!.length<2)
                                    return 'Title must be 2 characters at least';
                                },

                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultTextField(
                                label: 'Salon Phone',
                                icon: Icons.phone,
                                controller: controller.phoneController,
                                number: true,
                                validator: (val){
                                  if (val!.length<10)
                                    return 'Invalid Phone';
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultTextField(
                                label: 'Another Phone',
                                icon: Icons.phone,
                                number: true,
                                controller: controller.anotherPhoneController,
                                validator: (val){
                                  if (val!.length<10)
                                    return 'Invalid Phone';
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultTextField(
                                label: 'Password',
                                icon: Icons.security,
                                password: true,
                                controller: controller.passwordController,
                                validator: (val){
                                  if (val!.length<6)
                                    return 'Password 6 characters at least';
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'COUNTRY',
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
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
                                  buttonWidth: width,
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
                              Text(
                                'CITY',
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  items: controller.cities
                                      .map((item) => DropdownMenuItem<int>(
                                            value: item.id,
                                            child: InkWell(
                                              onTap: () {},
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
                                  buttonWidth: width,
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
                              Text(
                                'AREA',
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.bold),
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
                                  buttonWidth: width,
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
                              DefaultTextField(
                                label: 'Street Name',
                                icon: Icons.comment,
                                controller: controller.streetController,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultTextField(
                                label: 'Description English',
                                icon: Icons.account_box_outlined,
                                description: true,
                                controller: controller.descriptionEnController,
                                validator: (val){
                                  if (val!.length<10)
                                    return 'Too short description';
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DefaultTextField(
                                label: 'Description Arabic',
                                icon: Icons.account_box_outlined,
                                description: true,
                                controller: controller.descriptionArController,
                                validator: (val){
                                  if (val!.length<10)
                                    return 'Too short description';
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
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
                              SizedBox(
                                height: 20,
                              ),
                              Row(
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
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: height * 0.4,
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
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      // if(_formKey.currentState!.validate())
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (_) => TimeOpeningInfo()));
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Constants.mainColor2),
                                      child: Center(
                                        child: Text(
                                          'NEXT',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  VerticalProgress(
                    height: height,
                    progressHeight: height / 2,
                    index: 1,
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
