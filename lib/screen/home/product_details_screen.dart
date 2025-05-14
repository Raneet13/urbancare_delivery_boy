import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:urbancare_delivery_boy/static/app_color.dart';
import 'package:urbancare_delivery_boy/static/navigation_route/app_route.dart';
import 'package:urbancare_delivery_boy/static/show_toast/showTost_msg.dart';
import 'package:urbancare_delivery_boy/viewmodel/home_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../static/custom_elevated_button.dart';
import '../../viewmodel/bottom_viewmodel.dart';

class OrderDetailScreen extends StatefulWidget {
  String orderId;
  bool isCompleted;
  OrderDetailScreen({super.key,required this.isCompleted, required this.orderId});
  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController otpfield =TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<homeViewmodel>().orderdetail(orderId: widget.orderId);
    });
   
  }
  void showCustomDialog(BuildContext context,String orderId,String otp) {
  Get.dialog(
    barrierDismissible: false,
    Dialog(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure dialog resizes dynamically
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Form contents here
            Form(
              child: Column(
                 mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 6,
                    controller: otpfield,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      // fieldHeight: 50,
                      // fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.grey.shade300,
                      selectedFillColor: Colors.blue.shade100,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.blueAccent,
                    ),
                    onCompleted: (pin) {
                      print("Completed: $pin");
                    },
                    onChanged: (value) {
                      print("Changed: $value");
                    },
                  ),
                  SizedBox(height: 20),
                  // controller.isLoading.value
                  //     ? Center(child: CircularProgressIndicator())
                  //     : 
                      SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: customElevatedButton(
                            context: context,
                            buttonname: "Verify Phone",
                            onpressed: () {
                              if (otp==otpfield.text) {
                            Get.find<homeViewmodel>().changeDelsts(orderId: orderId,status: "2").then((v){

                          if (v) {
                             Get.find<homeViewmodel>().homeView();
                             Get.back();
                             Get.offAllNamed(Paths.nav);
                          }
                        });  
                          
                          }else if(otpfield.text.isEmpty){
                            ShowToast(msg: "First Enter OTP"); }else{
                              ShowToast(msg: "Enter Correct OTP");
                            }
                           
                            },
                          ),
                        ),
                  // SizedBox(height: 20),
                  const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  foregroundColor: Colo.white,
                  backgroundColor: Colors.red, // Button color
                ),
                child: const Text("Close"),
              ),
            ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  final BottomNavController controller =  Get.find<BottomNavController>();
  @override
  Widget build(BuildContext context) {
   final orderDetails = Get.find<homeViewmodel>();
    return Obx(
      ()=> DefaultTabController(
        length: 2,
        child: Scaffold(
          
          appBar: AppBar(
            elevation: 0,
            // backgroundColor: Colors.white,
            // leading: IconButton(onPressed: ()=>controller.updateIndex(0,controller.prevScreen.value), icon: Icon(Icons.arrow_back), color: Colors.black),
            // automaticallyImplyoLeading: true,
            title: Text(
              "${orderDetails.orderDetails.value.data?.orderNo??""}",
              style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colo.white)
            ),
            centerTitle: true,
            actions: [
            //    IconButton(
            //   onPressed: () async {
           
            //     // setState(() {
            //     //   result = res as String;
            //     // });
            //   },
            //   icon: Icon(Icons.qr_code),
            // )
            ],
          ),
          bottomSheet:  widget.isCompleted?SizedBox(): Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (orderDetails.orderDetails.value.data==null) {
                          null;
                        }else{
                        bool? allValid = orderDetails.orderDetails.value.data?.items?.every((item) {
    return item.quantity == item.barcodeCount;
  });
                           // controller.updateIndex(0,OrderDetailScreen());
                          //  print(allValid);
                        if (orderDetails.orderDetails.value.data?.statusId==2) {
                          // if (allValid!) {
                           
                        Get.find<homeViewmodel>().changeDelsts(orderId: orderDetails.orderDetails.value.data?.orderNo??"",status: "1").then((v){
                          if (v) {
                            Get.find<homeViewmodel>().homeView();
                            Get.back();
                          }
                        }) ;       
                        //  }
                        // //  else{
                        // //   ShowToast(msg: "First Scan Barcode Againest item"); 
                        // //   }
                    
                        } else {
                          Get.find<homeViewmodel>().deliveryboyDEliverUser(contact: orderDetails.orderDetails.value.data?.address?.regPhoneNum??"").then((v){
                            if (v!="") {
                               showCustomDialog(context,orderDetails.orderDetails.value.data?.orderNo??"",v);
                            }
                          });
                         
                         
                        }    
                        }
                      
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        "${orderDetails.orderDetails.value.data?.statusId==2?"Mark PickUp": "Mark Delivered"}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
          body:orderDetails.isLoading.value?Center(child: CircularProgressIndicator(),): orderDetails.orderDetails.value.data==null?SizedBox() :   RefreshIndicator(
              onRefresh: ()async{
Get.find<homeViewmodel>().orderdetail(orderId: widget.orderId);
              },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ordered by section
                        ListTile(
                          // contentPadding: EdgeInsets.zero,
                          // minVerticalPadding: 22,
                        
                          title: Text("Ordered by", style: TextStyle(color: Colors.grey)),
                          subtitle: Text("${orderDetails.orderDetails.value.data?.orderedBy??""}", style: TextStyle(fontSize: 16)),
                          trailing:widget.isCompleted?SizedBox(): InkWell(onTap: ()=> launch("tel://${orderDetails.orderDetails.value.data?.address?.regPhoneNum??""}"), child: Icon(Icons.phone, color: Colors.blue)),
                        ),
                        // Order status section
                        ListTile(
                          title: Text("Order status", style: TextStyle(color: Colors.grey)),
                          subtitle: Text(
                            "${orderDetails.orderDetails.value.data?.orderStatus??""}",
                            style: TextStyle(fontSize: 16, ),
                          ),
                          // trailing: Icon(Icons.motorcycle, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  // Tab bar for Order Info and Cloth List
                  Container(
                    color: Colors.grey[200],
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(top: 8),
                    child: TabBar(
                      controller: _tabController,
                       indicatorSize: TabBarIndicatorSize.label,
                       indicatorPadding: EdgeInsets.zero,
                       labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                    color: Colors.white, // Selected tab background
                    // borderRadius: BorderRadius.circular(8),
                      ),
                      labelColor: Colors.black, // Selected tab text color
                      unselectedLabelColor: Colors.black, // Un
                    labelStyle: TextStyle(fontSize: 16),
                    
                      dividerColor: Colors.transparent,
                      tabs: [
                          Tab(
                        child: Container(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width/2,
                      alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: _tabController.index == 0 ? Colors.white : Colors.blue, // Unselected tab color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Order Info"),
                        ),
                      ),
                      Tab(
                        child: Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width/2,
                      alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: _tabController.index == 0 ? Colors.white : Colors.blue, // Unselected tab color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Cloth List"),
                        ),
                      ),
                      ],
                    ),
                  ),
                  // Tab bar view for the two tabs
                  SizedBox(
                    height: 600, // Set a fixed height for TabBarView
                    child: 
                    TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        // Order Info tab content
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("${orderDetails.orderDetails.value.data!.statusId!>=2?"PickUp": ""} Schedule", style: TextStyle(color: Colors.grey)),
                                subtitle: Text("${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse("${orderDetails.orderDetails.value.data?.pickedUpTime??""}"))}", style: TextStyle(fontSize: 16)),
                                // trailing: Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text("Delivery", style: TextStyle(color: Colors.grey)),
                                //     // Text("${DateFormat('yyyy-MM-dd').format(DateTime.parse("${orderDetails.orderDetails.value.data?.deliveryTime??""}"))}", style: TextStyle(fontSize: 16)),
                                //   ],
                                // ),
                              ),
                              orderDetails.orderDetails.value.data?.deliveryBoyPickupTime==null?SizedBox(): ListTile(
                                title: Text("${orderDetails.orderDetails.value.data!.statusId!>=2?"PickUp": ""}", style: TextStyle(color: Colors.grey)),
                                subtitle: Text("${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse("${orderDetails.orderDetails.value.data?.deliveryBoyPickupTime??""}"))}", style: TextStyle(fontSize: 16)),
                                // trailing: Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text("Delivery", style: TextStyle(color: Colors.grey)),
                                //     // Text("${DateFormat('yyyy-MM-dd').format(DateTime.parse("${orderDetails.orderDetails.value.data?.deliveryTime??""}"))}", style: TextStyle(fontSize: 16)),
                                //   ],
                                // ),
                              ),
                              orderDetails.orderDetails.value.data?.deliveryTime==null?SizedBox(): ListTile(
                                title: Text("${orderDetails.orderDetails.value.data?.statusId==7?"Delivery":""} Schedule", style: TextStyle(color: Colors.grey)),
                                subtitle: Text("${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse("${orderDetails.orderDetails.value.data?.deliveryTime??""}"))}", style: TextStyle(fontSize: 16)),
                                // trailing: Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text("Delivery", style: TextStyle(color: Colors.grey)),
                                //     // Text("${DateFormat('yyyy-MM-dd').format(DateTime.parse("${orderDetails.orderDetails.value.data?.deliveryTime??""}"))}", style: TextStyle(fontSize: 16)),
                                //   ],
                                // ),
                              ),
                              orderDetails.orderDetails.value.data?.deliveryBoyDeliveredTime==null?SizedBox(): ListTile(
                                title: Text("${orderDetails.orderDetails.value.data?.statusId==7?"Delivery":""}", style: TextStyle(color: Colors.grey)),
                                subtitle: Text("${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse("${orderDetails.orderDetails.value.data?.deliveryBoyDeliveredTime??""}"))}", style: TextStyle(fontSize: 16)),
                                // trailing: Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text("Delivery", style: TextStyle(color: Colors.grey)),
                                //     // Text("${DateFormat('yyyy-MM-dd').format(DateTime.parse("${orderDetails.orderDetails.value.data?.deliveryTime??""}"))}", style: TextStyle(fontSize: 16)),
                                //   ],
                                // ),
                              ),
                              Divider(height: 6,color: Colors.grey[300],),
                              
                              
                              ListTile(
                                title: Text("Pick up Address", style: TextStyle(color: Colors.grey)),
                                subtitle: Text(
                                  "${orderDetails.orderDetails.value.data?.address?.address??""},\n${orderDetails.orderDetails.value.data?.address?.state??""}, ${orderDetails.orderDetails.value.data?.address?.city??""}, ${orderDetails.orderDetails.value.data?.address?.zipCode??""}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                trailing: Icon(Icons.navigation, color: Colors.blue),
                              ),
                              Divider(height: 6,color: Colors.grey[300],),
                              
                              ListTile(
                                title: Text("Payment", style: TextStyle(color: Colors.grey)),
                                subtitle: Text(
                                  "\u{20B9} ${orderDetails.orderDetails.value.data?.payment?.amount??""}\n${orderDetails.orderDetails.value.data?.payment?.paymentMethod??""}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                // trailing: ElevatedButton(
                                //   onPressed: () {},
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: Colors.lightBlue[50],
                                //     foregroundColor: Colors.blue,
                                //   ),
                                //   child: Text("View Billing"),
                                // ),
                              ),
                            ],
                          ),
                        ),
                        // Cloth List tab content (You can add cloth list details here)
                        ListView.builder(
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: orderDetails.orderDetails.value.data?.items?.length,
                          itemBuilder: (context,ind){
                          return Column(
                            children: [
                              ListTile(
                                // contentPadding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
                                //  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                 titleAlignment:ListTileTitleAlignment.center,
                                // tileColor: Colors.red,
                                // dense: true,
                                isThreeLine: true,
                                title: Row(
                                  children: [
                                    Text("${orderDetails.orderDetails.value.data?.items?[ind].name??""}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),),
                                    SizedBox(width: 10,),
                                       Text("Qty: ${orderDetails.orderDetails.value.data?.items?[ind].quantity??""}",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14,color: Colo.primaryColor,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                 subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("${orderDetails.orderDetails.value.data?.items?[ind].service??""}"),
                                     Text("\u{20B9} ${orderDetails.orderDetails.value.data?.items?[ind].price??""}")
                                   ],
                                 ),
                                  // trailing:(orderDetails.orderDetails.value.data?.items?[ind].quantity??0 )- (orderDetails.orderDetails.value.data?.items![ind].barcodeCount??0)==0&& orderDetails.orderDetails.value.data?.items?[ind].barcodeNo!=null||widget.isCompleted?Text("${orderDetails.orderDetails.value.data?.items?[ind].barcodeNo??""}"): Row(
                                  //   mainAxisSize: MainAxisSize.min,
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                  //   children: [
                                  //     Text("${ (orderDetails.orderDetails.value.data?.items?[ind].quantity??0 )- (orderDetails.orderDetails.value.data?.items![ind].barcodeCount??0)}  X"),
                                  //     IconButton(
                                  //       onPressed: ()async{
                                  //       await SimpleBarcodeScanner.scanBarcode(
                                  //                       context,
                                  //                       barcodeAppBar: const BarcodeAppBar(
                                  //                         appBarTitle: 'BarCode Scanning',
                                  //                         centerTitle: false,
                                  //                         enableBackButton: true,
                                  //                         backButtonIcon: Icon(Icons.arrow_back_ios),
                                  //                       ),
                                  //                       // isShowFlashIcon: true,
                                  //                       delayMillis: 2000,
                                  //                       cameraFace: CameraFace.back,
                                  //                     ).then((v){
                                  //                        Get.find<homeViewmodel>().scanBarcod(orderId: orderDetails.orderDetails.value.data?.items?[ind].id.toString()??"",barcodeNum: v.toString()).then((v){
                                  //                         Get.find<homeViewmodel>().orderdetail(orderId: widget.orderId);
                                  //                         // if (v) {
                                  //                         //   print("barcode print response $v");
                                  //                         //   // Get.back();
                                  //                         // } else {
                                  //                         //   ShowToast(msg: "error to find Number");
                                  //                         // }
                                  //                        });
                                  //                     });  
                                  //     }, icon:Icon(Icons.qr_code_scanner_outlined,)),
                                  //   ],
                                  // ),
                              
                              ),
                             
                              Padding(
                                padding: const EdgeInsets.only(left: 16,right: 16),
                                child: Divider(height: 0,color: Colors.grey[300],),
                              ),
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
