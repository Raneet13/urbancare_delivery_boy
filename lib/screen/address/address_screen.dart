import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/screen/address/add_address_screen.dart';
import 'package:urbancare_delivery_boy/viewmodel/address_viewmodel.dart';
import '../../model/address_model.dart';
import '../../static/app_color.dart';

class AddressPage extends GetView<addressViewmodel> {
  // id;
  static const routeName = '/address';

  // AddressPage({this.id, super.key});

//   @override
//   State<AddressPage> createState() => _AddressPageState();
// }

// class _AddressPageState extends State<AddressPage> {
// @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //       WidgetsBinding.instance.addPostFrameCallback((_) {
//   //     Provider.of<BucketProvider>(context,listen: false).listAddress();
//   //   });

//   // }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Addresses',
          style: TextStyle(color: Colo.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colo.white),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 35),
                 shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
              ),
              onPressed: (){
              
              Navigator.of(context).pop();
            }, child: Text("Submit")),
          ),
          SizedBox(width: 10,)
        ],
        backgroundColor: Colo.primaryColor,
      ),
      body:  Obx(
        ()=>controller.address.value ==null?Center(child: CircularProgressIndicator(),): controller.address.value?.addresses?.length==0?SizedBox(): Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // List of Existing Addresses
                 Expanded(
                    // child:profileProvider.viewAllAddress==null?Center(child: CircularProgressIndicator(),): profileProvider.viewAllAddress!.addresses!.isEmpty
                    //     ? Center(
                    //   child: Text(
                    //     'No addresses available. Please add a new address.',
                    //     style: TextStyle(color: Colors.grey[600]),
                    //   ),
                    // )
                    //     : 
                      child:  ListView.builder(
                      itemCount: controller.address.value?.addresses?.length,//profileProvider.viewAllAddress!.addresses!.length,
                      itemBuilder: (context, index) {
                        // final address = profileProvider.viewAllAddress!.addresses![index];
                        // print(address);
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text("${controller.address.value?.addresses![index].adress1??""}"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                    'CITY : ${controller.address.value?.addresses![index].city??""}'),
                                 Text(
                                    'STATE : ${controller.address.value?.addresses![index].state??""}'),
                                 Text(
                                    'PIN : ${controller.address.value?.addresses![index].zipCode??""}'),
                                Text(
                                    'PHONE : ${controller.address.value?.addresses![index].phoneNumber??""}'),
                              ],
                            ), // Display name and phone number //${address.name}
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon:controller.selectedAddress.value?.id ==null? const Icon(Icons.radio_button_off, color: Colors.black):controller.selectedAddress.value!.id==controller.address.value?.addresses![index].id?const Icon(Icons.radio_button_checked, color: Colors.black):const Icon(Icons.radio_button_off, color: Colors.black),
                                  onPressed: () {
                                   controller.selectAddress(controller.address.value?.addresses![index]??Address());
                                    // print(profileProvider.selectedAddress);
                                  //  profileProvider.selectAddress(address);
                                    // _confirmDeleteAddress(context, address.id.toString());
                                  },
                                ),
                                //profileProvider.selectedAddress!.id==address.id?const Icon(Icons.radio_button_checked, color: Colors.black): 
                                // Radio<Address>(
                                //   value: address,
                                //   // groupValue: profileProvider,
                                //   groupValue:
                                //   profileProvider.selectedAddress,
                                  
                                //   onChanged: (Address? value) {
                                //     print(value?.toJson());
                                //     // if (value != null) {
                                //     //   profileProvider.selectAddress(value);
                                //     // }
                                //   },
                                // ),
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.red),
                                  onPressed: () {
                                    Get.to(()=>AddAddressPage(id: controller.address.value?.addresses![index]??Address()));
                                    // print(profileProvider.selectedAddress?.toJson());
                                    // _confirmDeleteAddress(context, address.id.toString());
                        //        Navigator.push(
                        // context,
                        // MaterialPageRoute(builder: (context) => AddAddressPage(id: address.id,)),
                      // );
                                  },
                                ),
                              ],
                            ),
                          
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Button to Add New Address
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.to(()=>AddAddressPage());
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AddAddressPage()),
                      // );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colo.white,
                    ),
                    label: const Text(
                      'Add New Address',
                      style: TextStyle(color: Colo.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colo.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      )
    );
  }

  /// Confirms deletion of an address
  void _confirmDeleteAddress(BuildContext context, String addressId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Address'),
        content: const Text('Are you sure you want to delete this address?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Provider.of<ProfileProvider>(context, listen: false)
              //     .removeAddress(addressId);
              // Navigator.of(ctx).pop();
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('Address deleted successfully.')),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
