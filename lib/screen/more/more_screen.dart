import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/screen/more/edit_profile.dart';
import 'package:urbancare_delivery_boy/screen/more/show_web.dart';
import 'package:urbancare_delivery_boy/static/app_color.dart';
import 'package:urbancare_delivery_boy/viewmodel/auth_viewmodel.dart';
import 'package:urbancare_delivery_boy/viewmodel/profile_viewmodel.dart';

import '../../data/app_url.dart';
import '../address/address_screen.dart';
import '../auth/login_screen.dart';
class MoreScreen extends GetView<profileViewmodel> {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final profile = Provider.of<ProfileProvider>(context).profile;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colo.primaryColor,
        title: const Text(
          'More',
          style: TextStyle(color: Colo.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colo.white,
        ),
      ),
      body: Obx(
        ()=> ListView(
          padding: const EdgeInsets.all(12),
          children: [
            // Welcome Section
        
                Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colo.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Ink(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: controller.profileImage != null
                                        ? FileImage(controller.profileImage!)
                                        :controller.editprofileImage!=null?NetworkImage(controller.editprofileImage??""):  AssetImage("asset/delivery_boy.png"))
                                    ),
                                    // radius: 25,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${controller.profile.value?.user?.name ??""}',//
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                   Get.to(EditProfilePage());
                                },
                                child: Container(
                                                            decoration: BoxDecoration(
                                color: Colo.primaryColor,
                                shape: BoxShape.circle,
                                // border: Border.all(color: Colo.white, width: 2),
                                                            ),
                                                            padding: const EdgeInsets.all(8),
                                                            child: const Icon(
                                Icons.edit,
                                color: Colo.white,
                                size: 20,
                                                            ),
                                                          ),
                              ),
                             
                              // PopupMenuButton<String>(
                              //   onSelected: (String result) {
                              //     if (result == 'Edit Profile') {
                                    
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(builder: (context) => const EditMoreScreen()),
                              //       // );
                              //     }
                              //   },
                              //   itemBuilder: (BuildContext context) {
                              //     return {'Edit Profile'}.map((String choice) {
                              //       return PopupMenuItem<String>(
                              //         value: choice,
                              //         child: Text(choice),
                              //       );
                              //     }).toList();
                              //   },
                              //   icon: const Icon(Icons.more_vert),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${controller.profile.value?.user?.email??""}",
                            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${controller.profile.value?.user?.contactNo??""}",
                            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),
                          // const Text(
                          //   'Saved Address:',
                          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          // ),
                          // Text(
                          //   "profile.profile?.user?.address??""",
                          //   style: const TextStyle(fontSize: 16),
                          // ),
                        ],
                      ),
                    ),
                  
        
        
            
            const SizedBox(height: 10),
        
            // Options Section
            // _buildOptionItem(context, 'Saved Addresses', Icons.location_on_outlined),
            // _buildOptionItem(context, 'Subscription', Icons.subscriptions_rounded),
            //  _buildOptionItem(context, 'Wallet', Icons.wallet),
            _buildOptionItem(context, 'Terms and Conditions', Icons.assignment),
            _buildOptionItem(context, 'Support', Icons.question_mark),
            
            _buildOptionItem(context, 'Logout', Icons.logout),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Saved Addresses':
          Get.to(()=>AddressPage());
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) =>  AddressPage()),
            // );
            break;
          // case 'Subscription':
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) =>  SubscriptionPage()),
          //   );
          //   break;
          //    case 'Wallet':
          //  Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => WalletPage()),
          //     );
          //   break;
          // case 'Refer and Earn':
          // // Navigate to Refer and Earn Page
          //   break;
          case 'Terms and Conditions':
          // Navigate to Terms and Conditions Page
          //  Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ShowWeb(urll: AppUrl.terms,)),
          //     );
          Get.to(()=>ShowWeb(urll: AppUrl.terms));
          
            break;
          case 'Support':
          // Navigate to Support Page
          Get.to(()=>ShowWeb(urll: AppUrl.support));
          //  Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ShowWeb(urll: AppUrl.support,)),
          //     );
            break;
          case 'Logout':
            _showLogoutDialog(context);
            break;
          default:
          // Handle unknown options or provide a default action
            print('Tapped on $title');
        }
      },
      
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colo.primaryColor),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 10,),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Get.find<AuthViewmodel>().logout().then((v){
Get.to(()=>LoginScreen());
                });
                
                // Implement logout functionality
                // Provider.of<ProfileProvider>(context, listen: false).logout().then((v){
//  Navigator.of(context).pop();
//  Navigator.of(context).pushAndRemoveUntil(
//                                           MaterialPageRoute(
//                                               builder: (context) => SignInPage()),
//                                               (route) => false
//                                         );
//   // Navigator.pushReplacement(context, MaterialPageRoute(
//   //                         builder: (context) {
//   //                           return const SignInPage();
//   //                         },
//   //                       ));
//                 });
                // Navigator.of(context).pop();
                // print('Logged out');
                // You might want to navigate to a login screen here
              },
            ),
          ],
        );
      },
    );
  }
}
