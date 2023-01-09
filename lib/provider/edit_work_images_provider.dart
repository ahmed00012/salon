
import 'dart:async';
import 'dart:io';
import 'package:beauty_center/repository/salon_info_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../constants.dart';
import '../repository/work_images_repository.dart';




final editImagesFuture =
ChangeNotifierProvider.autoDispose<EditWorkImagesProvider>((ref) => EditWorkImagesProvider());
class EditWorkImagesProvider extends ChangeNotifier {
  WorkImagesRepo repo = WorkImagesRepo();
  List<File> images = [];
  List<String> currentImages = [];
  int imageLength = 1;
  final ImagePicker picker = ImagePicker();



  EditWorkImagesProvider(){

  }


  pickImageSalon() async {
     List<XFile> pickedImages = await picker.pickMultiImage();
     pickedImages.forEach((element) {
       images.add(File(element.path));
     });
    addImage();
    notifyListeners();
  }

  addImage(){
    if(images.length==imageLength&&imageLength<11)
      imageLength = imageLength +1;
    notifyListeners();
  }
  removeImage(int i){
    imageLength = imageLength -1;
    images.removeAt(i);
    notifyListeners();
  }


  Future updateProviderInfo(BuildContext context)async{
    
   
    var data = await repo.storeWorkImages(images);
    if(data!=false){
      Navigator.pop(context);
      displayToastMessage('Your Information Updated Successfully',false,context);
    }


    notifyListeners();
  }



  void displayToastMessage(var toastMessage, bool alert,BuildContext context) {
    showTopSnackBar(
      context,
      alert ?
      CustomSnackBar.error(
        message:
        toastMessage,
      ) :
      CustomSnackBar.success(
        message:
        toastMessage,
        backgroundColor: Constants.mainColor,
      ),
    );
  }


}