import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbancare_delivery_boy/repository/home/home_repository.dart';

import '../model/home_model.dart';
import '../model/profile_viewmodel.dart';

class profileViewmodel extends GetxController {
    var isLoading = false.obs;
Rx<ProfileModel?> profile = ProfileModel().obs;
 Rx<String?> selectedGender = Rx<String?>(null);
Address? _selectedAddress;
  // ProfileModel? profile;
  File? profileImage;
   final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage =Rx<File?>(null);
  String? editprofileImage;
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController altnumController= TextEditingController();
  TextEditingController numberController= TextEditingController();
  @override
  void onInit() {
    ViewProfile();
    super.onInit();
  }
  Future ViewProfile() async {
    late bool rsp =false;
    isLoading(true);
    try {
       final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().ViewProfileApi(userId: userId);
      // print(resp);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        print(resp);
profile.value = ProfileModel.fromJson(resp);
        rsp=true;
        initProfile();
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
initProfile(){
  nameController.text = profile.value?.user?.name??"";
  emailController.text = profile.value?.user?.email??"";
  numberController.text = profile.value?.user?.contactNo??"";
  editprofileImage = profile.value?.user?.profileImage??"";
  altnumController.text = profile.value?.user?.alterContactNo??"";
  selectedGender.value=profile.value?.user?.gender??"";
  // print(selectedGender.value);
}
//update profile
selectyourGender( String gender){
  print(gender);
  selectedGender.value = gender;
}
  Future updateProfile() async {
    late bool rsp =false;
    isLoading(true);
    try {
      // print(selectedGender.value);
       final prefs = await SharedPreferences.getInstance();
       String? userId =    await prefs.getString('userId');
      var resp = await HomeApiRepository().editProfile(userId: userId!, img: selectedImage.value, gender: selectedGender.value.toString(), name: nameController.text, phoneNo: numberController.text, email: emailController.text, altphone: altnumController.text);
     if (resp != null&& resp["success"]) {
        isLoading(false);
        // print(resp);
        ViewProfile();
        rsp=true;
        }
      
    } catch (e) {debugPrint(e.toString());} finally {
      isLoading(false);

    }
    return rsp;
  }
 void showImageSourceDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image From:'),
          content: const Text('Choose the image source for your profile photo.'),
          actions: [
            TextButton(
              child: const Text('Gallery'),
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
            TextButton(
              child: const Text('Camera'),
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  // Function to pick image from specified source
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile =
      await _picker.pickImage(source: source, imageQuality: 80);

      if (pickedFile != null) {
        // setState(() {
          selectedImage.value = File(pickedFile.path);
          
        // });
      }
    } catch (e) {
      // Handle any errors here
      print('Error picking image: $e');
    }
  }
   
}