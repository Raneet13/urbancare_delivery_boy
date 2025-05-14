
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:urbancare_delivery_boy/model/address_model.dart';
import 'package:urbancare_delivery_boy/viewmodel/address_viewmodel.dart';

import '../../static/app_color.dart';

class AddAddressPage extends StatefulWidget {
   Address? id;
  AddAddressPage({this.id, super.key});

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _formKey = GlobalKey<FormState>();
  // String addressLine1 = '';
  // String addressLine2 = '';
  // String city = '';
  // String state = '';
  // String zipCode = '';
  // String name = ''; // New variable for name
  // String phoneNumber = ''; // New variable for phone number
 @override
void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.id!=null) {
        Get.find<addressViewmodel>().fillAddress(addr: widget.id!);
      
    
    //  Provider.of<BucketProvider>(context,listen:false).initAddress(id: widget.id!);   
      }
      
    }); 
  //  Future initAddress({)

    // list.add(MainPage());
    // print('initState() ---> ${list[0]}'); // This will print "initState() ---> MainPage"
}

  @override
  Widget build(BuildContext context) {
    final addressViewmodel address = Get.put(addressViewmodel());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Address',
          style: TextStyle(color: Colo.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colo.white),
        centerTitle: true,
        backgroundColor: Colo.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
                children: [
                  // New Name Field
//                   TextFormField(
// controller: address.address_name,
//                     decoration: const InputDecoration(labelText: 'Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a Name';
//                       }
//                       return null;
//                     },
//                     // onSaved: (value) {
//                     //   name = value!;
//                     // },
//                   ),
                  // New Phone Number Field
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    controller: address.phone,
                     inputFormatters:[
            LengthLimitingTextInputFormatter(10),
          ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        
                        return 'Please enter a Phone Number';
                      }else if(value.length !=10){
return 'Please enter valid Phone Number';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   phoneNumber = value!;
                    // },
                  ),
                  // Address Line 1
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Address Line 1'),
                    controller: address.addr1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Address Line 1';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   addressLine1 = value!;
                    // },
                  ),
                  // Address Line 2
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Address Line 2'),
                    controller: address.addr2,
                    // onSaved: (value) {
                    //   addressLine2 = value ?? '';
                    // },
                  ),
                  // City
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'City'),
                    controller: address.city,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter City';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   city = value!;
                    // },
                  ),
                  // State
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'State'),
                    controller: address.state,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter State';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   state = value!;
                    // },
                  ),
                  // Zip Code
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Zip Code'),
                    keyboardType: TextInputType.number,
                    controller:  address.zip,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Zip Code';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   zipCode = value!;
                    // },
                  ),
                  const SizedBox(height: 24),
                  // Save Button
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()&&!address.isLoading.value) {
                        if (widget.id==null) {
                          address.addAddress().then((v){
                          if (v) {
                            Navigator.of(context).pop();
                            // Get.put();
                          }
                        });
                        } else {
                           address.updateAddress(addresI: widget.id.toString()).then((v){
                          if (v) {
                            Navigator.of(context).pop();
                          }
                        });
                        }
                        
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colo.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child:address.isLoading.value?const CircularProgressIndicator(): const Text('Save Address', style: TextStyle(color: Colo.white)),
                  ),
                ],
              )
        ),
      ),
    );
  }

  /// Saves the new address
}
