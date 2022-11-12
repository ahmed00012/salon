import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants.dart';

class AddLicence extends StatelessWidget {
   AddLicence({Key? key,this.licence}) : super(key: key);
  File? licence ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:
      licence!=null?
      ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(licence!,fit: BoxFit.fill)):
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black38)
        ),
        child: Center(
          child: Icon(Icons.add,size: 30,color: Colors.black38,),
        ),
      ),
    );
  }
}
