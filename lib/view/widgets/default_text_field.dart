

import 'package:flutter/material.dart';

import '../../constants.dart';

class DefaultTextField extends StatefulWidget {

   DefaultTextField({Key? key,this.icon,this.label,this.number,
     this.image,this.description,this.password,this.controller,this.validator}) : super(key: key);

  String? label;
  IconData? icon;
  bool? number;
  String? image;
  bool? description;
  bool? password;
  TextEditingController ?controller ;
   final String? Function(String?)? validator;


  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {

  bool focus2 = false;
  bool seePassword = false;
  TextEditingController controller2 =TextEditingController();

@override
  void initState() {
    // TODO: implement initState
  widget.password=false;
    super.initState();
  }


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
            controller: widget.controller ?? controller2,
            cursorColor: Constants.mainColor2,
            keyboardType:widget.number!=null? TextInputType.number:TextInputType.text,
            maxLines: widget.description!=null && widget.password==null?4:1,
            obscureText: widget.password!=null&&!seePassword,
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


              labelText: widget.label,
              labelStyle: TextStyle(color:focus2?
              Constants.mainColor2:Colors.black45,

                  fontWeight: FontWeight.bold,fontSize: 14),
              prefixIcon:widget.icon!=null? Icon(widget.icon,
                  color: Constants.mainColor2):Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(widget.image! ,width: 5,color: Constants.mainColor2,),
                  ),
              suffixIcon: widget.password??false?InkWell(
                onTap: (){
                  setState(() {
                    seePassword=!seePassword;
                  });
                },
                child: Icon(
                  seePassword?
                  Icons.visibility_off:
                  Icons.remove_red_eye,
                  color: Colors.black38,
                ),
              ):Container(
                height: 0,
                width: 0,
              )
            ),

            validator: widget.validator,
          ),
        ),
      ),
    );
  }
}
