//
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
//
// class DropDown extends StatelessWidget {
//   List<String> ? list = [];
//   String? listValue;
//   bool? focus = false;
//   DropDown({this.focus,this.list,this.listValue});
//
//   @override
//   Widget build(BuildContext context) {
//     return  DropdownButtonHideUnderline(
//       child: DropdownButton2(
//
//
//         items: controller.countries
//             .map((item) =>
//             DropdownMenuItem<String>(
//               value: item,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 35),
//                 child: Text(
//                   item,
//                   style: const TextStyle(
//                     fontSize: 14,
//
//                     color: Colors.black,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ))
//             .toList(),
//         value: controller.countryValue,
//         onChanged: (value) {
//           setState(() {
//             controller.countryValue = value as String;
//           });
//         },
//         icon: const Icon(
//           Icons.arrow_forward_ios_outlined,
//           color: Constants.mainColor2,
//         ),
//         onMenuStateChange: (opened){
//           setState((){
//             countryFocus = opened;
//           });
//         },
//         iconSize: 14,
//
//         buttonHeight: height*0.06,
//
//         buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//         buttonDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             border: Border.all(
//                 color: countryFocus?Constants.mainColor2:Colors.white
//             )
//
//
//         ),
//         buttonElevation: 0,
//         dropdownDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//         ),
//         dropdownElevation: 0,
//         offset: const Offset(0, -5),
//       ),
//     );
//   }
// }
