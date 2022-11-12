import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AnotherCategory extends StatefulWidget {
   AnotherCategory({Key? key,this.anotherCategories,this.onChanged}) : super(key: key);
List<String> ?anotherCategories ;
Function(String category,String name) ?onChanged;


  @override
  State<AnotherCategory> createState() => _AnotherCategoryState();
}

class _AnotherCategoryState extends State<AnotherCategory> {
String? chosenCategory = '';
bool focus2 = false;
@override
  void initState() {
    chosenCategory = widget.anotherCategories![0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height < 600
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(


              items: widget.anotherCategories!
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,

                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ))
                  .toList(),
              value: chosenCategory,
              onChanged: (value) {
                setState(() {
                  chosenCategory = value as String;
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Constants.mainColor2,
              ),
              iconSize: 14,
              buttonHeight: height*0.06,
              buttonWidth: width*0.8,
              buttonPadding: const EdgeInsets.only(left: 5, right: 14),
              buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                      color: Constants.mainColor2
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
        ),

        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            width: width*0.8,

            decoration: BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.circular(10),

            ),
            child: FocusScope(
              child: Focus(
                onFocusChange: (focus) => setState(() {focus2 = focus;}),
                child: TextFormField(
                  cursorColor: Constants.mainColor2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 1, color: Constants.mainColor2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 1, color: Constants.mainColor2),
                    ),
                    hintText: 'Name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintStyle: TextStyle(color:focus2?
                    Constants.mainColor2:Colors.black45,
                        fontWeight: FontWeight.bold,fontSize: 14),

                  ),
                  onChanged: (value){
                    setState(() {
                      widget.onChanged!(chosenCategory!,value);
                    });
                  },

                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}
