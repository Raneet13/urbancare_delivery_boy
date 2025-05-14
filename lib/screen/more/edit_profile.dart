import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/viewmodel/profile_viewmodel.dart';

import '../../static/app_color.dart';

class EditProfilePage extends GetView<profileViewmodel> {
  EditProfilePage({super.key});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   // Controllers to manage input fields
  final _formKeyProfile = GlobalKey<FormState>();

//   // Variable to hold the selected image


//   // ImagePicker instance


//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final profile = Provider.of<ProfileProvider>(context, listen: false);
//       controller.initProfile();
//     });
//     // _nameController = TextEditingController(text: profile.name);
//     // _emailController = TextEditingController(text: profile.email);
//     // _numberController = TextEditingController(text: profile.number);
//     // _addressController = TextEditingController(text: profile.address);
//     // _selectedImage = profile.profileImage;
//   }

  // Function to show the selection dialog

  @override
  Widget build(BuildContext context) {
    // final profile = Provider.of<ProfileProvider>(context).profile;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colo.white,
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 24, color: Colo.white),
        ),
        backgroundColor: Colo.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
        child:Form(
              key: _formKeyProfile,
              child: Column(
                children: [
                  // Profile Photo Section
                  Obx(
                    ()=> GestureDetector(
                      onTap:()=> controller.showImageSourceDialog(context), // Show dialog on tap
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colo.primaryColor.withOpacity(0.2),
                            backgroundImage: controller.selectedImage.value != null
                                ? FileImage(controller.selectedImage.value!)
                                :controller.editprofileImage!=null?NetworkImage(controller.editprofileImage??""): const AssetImage("asset/teashop.jpeg") as ImageProvider,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colo.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colo.white, width: 2),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.edit,
                                color: Colo.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  const SizedBox(height: 20),
              
                  // Name Input
                  _buildTextField(
                    label: "Name",
                    controller: controller.nameController,
                  ),
              
                  const SizedBox(height: 8),
              
                  // Email Input
                  _buildTextField(
                    label: "Email",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                              "Select Gender",
                              style:
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                  ),
        const SizedBox(height: 2),
        Obx(
          ()=> SizedBox(
            width: double.infinity,
            height: 50,
            child: DropdownButton<String>(
              isExpanded: true,
              style: TextStyle(color: Colo.black,fontSize: 16),
              
              value:controller.selectedGender.value,
              items: ["male","female","other"].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
            
                    child: Text(gender),
                  );
                }).toList(), onChanged: (String? value) {
                      controller.selectyourGender(value!);
                    }),
          ),
        ),
            
            //        DropdownButtonFormField<String>(
            //     decoration: InputDecoration(
            //       // labelText: "Select Gender",
            //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                

            //     ),
            //     items: ["Male","Female"].map((String gender) {
            //   return DropdownMenuItem<String>(
            //     value: gender,
            //     child: Text(gender),
            //   );
            // }).toList(),
            //     value: controller.selectedGender.value,
            //     onChanged: (String? value) {
            //       controller.selectyourGender(value!);
            //     },
            //     validator: (value) =>
            //         value == null ? "Please select a gender" : null,
            //   ),
              
                  const SizedBox(
                    height: 8,
                  ),
              
                  _buildTextField(
                    label: "Mobile Number",
                    controller: controller.numberController,
                    keyboardType: TextInputType.emailAddress,
                  ),
              
                  const SizedBox(height: 8),
              
                  // Address Input
                  _buildTextField(
                    label: "Alternate Contact",
                    controller: controller.altnumController,
                      keyboardType: TextInputType.emailAddress,
                  ),
              
                  const SizedBox(height: 30),
              
                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child:controller.isLoading.value?Center(child: CircularProgressIndicator(),): ElevatedButton(
                      onPressed: (){
                         if (_formKeyProfile.currentState!.validate()){
    if(controller.isLoading.value){
                          null;
                        }else{
                          controller.updateProfile().then((v){
                            if (v) {
                              Get.back();
                            }
                          });
                        }
                         }
                    
                        // print(controller.numberController);
              
                      },//_saveProfile,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colo.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child:controller.isLoading.value?const SizedBox(height: 40,width: 40, child: CircularProgressIndicator()):
                      const Text(
                        'Save Changes',
                        style: TextStyle(color: Colo.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        TextFormField(
        validator: (val){
          if (label=="Mobile Number") {
            if (val!.length==10) {
              return null;
            } else {
              return "Enter Valid Phone";
            }
          } else if(label=="Alternate Contact"){
            if (val==null ||val.isEmpty) {
              return null;
            } else {
              if (val.length==10) {
              return null;
            } else {
              return "Enter Valid Phone";
            }
            }
          }else if(label=="Email"){
            if (val!=null ||val!.isNotEmpty) {
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(val)) {
                    return 'Please enter a valid email';
                  }
            } else {
              return 'Please enter a valid email'; 
            }
          }else if(label=="Name"){
if (val!=null ||val!.isNotEmpty) {
              return null;
            } else {
              return "Enter Name";
            }
          }else{
            return null;
          }

        },
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters:label=="Mobile Number"||label=="Alternate Contact"? [
            LengthLimitingTextInputFormatter(10),
          ]:null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: "Enter your $label",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  // @override
  // void dispose() {
  //   // Dispose controllers when not needed
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _addressController.dispose();
  //   super.dispose();
  // }
}
