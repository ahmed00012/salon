import 'package:flutter/material.dart';

import '../../constants.dart';




class MyTimePickerTheme extends StatelessWidget {
   MyTimePickerTheme({Key? key,this.child}) : super(key: key);
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Constants.mainColor2,
              onSurface: Colors.black,
            ),
            timePickerTheme:
            TimePickerThemeData(
              entryModeIconColor: Colors.black26,
              dialBackgroundColor: Colors.grey[100],
              hourMinuteColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Color(0xfffc9b00).withOpacity(0.1)
                  : Colors.grey[100]!),
            ),
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(
                primary: Constants.mainColor2,
              ),
            ),

          ),
          child: child!,
        )
    );
  }
}
