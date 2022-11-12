import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants.dart';

class AddWorksPic extends StatelessWidget {
  AddWorksPic({Key? key,this.image}) : super(key: key);
  File? image ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:
      image!=null?
      ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(image!,fit: BoxFit.fill)):
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black38)
        ),
        child: Center(
          child: Icon(Icons.image,size: 30,color: Colors.black38,),
        ),
      ),
    );
  }
}
