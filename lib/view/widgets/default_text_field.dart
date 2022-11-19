

import 'package:flutter/material.dart';

import '../../constants.dart';

class DefaultTextField extends StatefulWidget {

   DefaultTextField({Key? key,this.icon,this.label,this.number}) : super(key: key);

  String? label;
  IconData? icon;
  bool? number;


  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {

  bool focus2 = false;




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height<600?800:MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*0.8,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),

      ),
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) => setState(() {focus2 = focus;}),
          child: TextFormField(
            cursorColor: Constants.mainColor2,
            keyboardType:widget.number!=null? TextInputType.number:TextInputType.text,
            decoration: InputDecoration(
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

              labelText: widget.label,
              labelStyle: TextStyle(color:focus2?
              Constants.mainColor2:Colors.black45,

                  fontWeight: FontWeight.bold,fontSize: 14),
              prefixIcon: Icon(widget.icon,
                  color: Constants.mainColor2),
            ),

          ),
        ),
      ),
    );
  }
}
