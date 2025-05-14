import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:urbancare_delivery_boy/model/home_model.dart';
import 'package:urbancare_delivery_boy/screen/home/product_details_screen.dart';
import 'package:urbancare_delivery_boy/static/app_color.dart';
import 'package:urbancare_delivery_boy/viewmodel/home_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../viewmodel/bottom_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  
  TabController? _tabController;
final BottomNavController controller = Get.put(BottomNavController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  Widget _buildDeliveryCard({required bool complete, String? status, String? orderNo, String? deliveryDate, String? time, String? payment, Address? address, String? buttonText}) {
    return Card(
      color: Colo.white,
      borderOnForeground: false,
      
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      surfaceTintColor: Colo.white,
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.white10,
              elevation: 0,
              borderOnForeground: false,
              // margin: EdgeInsets.only(right: 13),
              borderRadius: BorderRadius.circular(12),
              
              child: ListTile(
                // tileColor: Colo.primaryColor.withOpacity(0.1),
                // dense: true,
                horizontalTitleGap: 0,
              
                visualDensity:VisualDensity(horizontal: 0, vertical: -4),
                contentPadding: EdgeInsets.only(right: 8),
                leading: CircleAvatar(radius: 22,backgroundColor:complete?Colors.green: Colo.primaryColor,foregroundColor: Colo.white, child:complete?Icon(Icons.directions_bike_sharp): Icon(Icons.motorcycle_outlined)),
                title: Row(
                children: [
                  Icon(Icons.currency_rupee_outlined, size: 16),
                  // SizedBox(width: 4),
                  Text("$payment"),
                ],
              ),
              titleTextStyle:TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colo.black) ,
              minLeadingWidth: 50,
              subtitle:Text.rich(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  children: [
                    // TextSpan(
                    //   text: 'Order No : ',
                    //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                    // ),
                    TextSpan(
                      text: '$orderNo',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14)
                    ),
                  ]
                )
              ),
              trailing:complete||buttonText==""?SizedBox(): SizedBox(
                height: 30,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:buttonText=="Pickup"?Colors.grey:Colo.black,
                      foregroundColor: Colo.white
                      ,
                    padding: EdgeInsets.only(left: 5,right: 5),
                    minimumSize: Size(0, 10),
                 tapTargetSize:   MaterialTapTargetSize.shrinkWrap,
                      disabledForegroundColor: Colo.white,
                      surfaceTintColor: Colo.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    onPressed: () {
                      null;
                   
                      
                    },
                    child: Text(buttonText??"",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colo.white),),
                  ),
              ),
              ),
            ),
            
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 16),
                SizedBox(width: 4),
               deliveryDate==null?SizedBox():Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Date : ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${DateFormat('dd-MM-yyyy').format(DateTime.parse(deliveryDate??"") )}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14)
                  ),
                ]
              )
            ),
                SizedBox(width: 16),
              //  time==null?SizedBox(): Text("${DateFormat('hh:mm a').format(DateTime.parse(time??"")) }"),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.payments_outlined, size: 16),
                SizedBox(width: 4),
               deliveryDate==null?SizedBox():Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Mode : ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '$status',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14)
                  ),
                ]
              )
            ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 4),
           complete?SizedBox(): Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
              Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Address : ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    
                    text: '${address?.address1??""}, ${address?.city??""}, ${address?.zipCode??""}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14)
                  ),
                ]
              )
            ),
            SizedBox(height: 4),
              ],
            ),
             SizedBox(height: 4), 
          complete?SizedBox():  Row(
              children: [
                Icon(Icons.call, size: 16),
                SizedBox(width: 4),
                Text.rich(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              TextSpan(
               
                children: [
                  TextSpan(
                    text: 'Phone : ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,color: Colo.black)
                  ),
                  TextSpan(
                  recognizer: TapGestureRecognizer()
      ..onTap = () {
        // Launch phone dialer
        launch("tel://${address?.phoneNumber ?? ""}");
      },
    //                  onEnter: (e){
    // launch("tel://${address?.phoneNumber??""}");
    //             },
                    text: '${address?.phoneNumber??""}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14,color: Colors.blue)
                  ),
                ]
              )
            ),
            SizedBox(height: 8),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
     Get.to(()=> OrderDetailScreen(orderId: orderNo!,isCompleted: complete,));
              }, child: Text("View Details",style: TextStyle(decoration: TextDecoration.underline),),//
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
                minimumSize:Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap
              ),
              ),
            ),
            SizedBox(height: 4,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final home = Get.find<homeViewmodel>();
    return Scaffold(
      appBar: AppBar(
        // title: Text("Pickup & Deliveries"),
        automaticallyImplyLeading: false,
        title: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          labelColor: Colo.white,
          labelStyle: TextStyle(fontSize: 21),
          unselectedLabelColor: Colo.black,
          dividerHeight: 0,
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(text: "Assigned"),
            Tab(text: "Completed"),
          ],
          indicatorColor: Colors.blue,
        ),
      ),
    
      body: Obx(
        ()=>home.isLoading.value?Center(child: CircularProgressIndicator(),): Column(
          children: [
            SizedBox(height: 4,),
            Expanded(
              child: TabBarView(
                
                controller: _tabController,
                children: [
                home.home.value==null?SizedBox():  
              home.home.value?.assignedorder?.length==0?RefreshIndicator(
              onRefresh: ()async{
Get.find<homeViewmodel>().homeView();
              },child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(), child: SizedBox(height: MediaQuery.sizeOf(context).height*0.8,child: Center(child: Text("No Order"))),)):  RefreshIndicator(
              onRefresh: ()async{
Get.find<homeViewmodel>().homeView();
              },
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: home.home.value?.assignedorder?.length,
                    itemBuilder: (context,ind){
                      
                    return  home.home.value?.assignedorder?[ind].status=="to_assigned"? _buildDeliveryCard(
                      complete: false,
                         status:  "${home.home.value?.assignedorder?[ind].paymentMethod??""}",
                        orderNo:   home.home.value?.assignedorder?[ind].orderNo??"",
                         deliveryDate:  home.home.value?.assignedorder?[ind].orderTime.toString()??"",
                         time:  home.home.value?.assignedorder?[ind].time.toString(),
                         payment:   "${home.home.value?.assignedorder?[ind].restAmount??""}",
                         address:  home.home.value?.assignedorder?[ind].address,
                         buttonText: "Pickup",
                        ):_buildDeliveryCard(
                          complete:false,
                         status:  "${home.home.value?.assignedorder?[ind].paymentMethod??""}",
                        orderNo:   home.home.value?.assignedorder?[ind].orderNo??"",
                         deliveryDate:  home.home.value?.assignedorder?[ind].orderTime.toString()??"",
                         time:  home.home.value?.assignedorder?[ind].time.toString(),
                         payment:   "${home.home.value?.assignedorder?[ind].restAmount??""}",
                         address:  home.home.value?.assignedorder?[ind].address,
                         buttonText: "Delivered",
                        );
                  }),
              ),
                   home.home.value?.completeorder?.length==0?RefreshIndicator(
              onRefresh: ()async{
Get.find<homeViewmodel>().homeView();
              },child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(), child: SizedBox(height: MediaQuery.sizeOf(context).height*0.8, child: Center(child: Text("No Order"))),)):  RefreshIndicator(
              onRefresh: ()async{
Get.find<homeViewmodel>().homeView();
              },
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: home.home.value?.completeorder?.length,
                    itemBuilder: (context,ind){
                      
                    return _buildDeliveryCard(
                      complete: 
                      true,
                         status:  home.home.value?.completeorder?[ind].paymentMethod??"",
                        orderNo:   home.home.value?.completeorder?[ind].orderNo??"",
                         deliveryDate:  home.home.value?.completeorder?[ind].orderTime.toString()??"",
                         time:  home.home.value?.completeorder?[ind].time.toString(),
                         payment:   "${home.home.value?.completeorder?[ind].restAmount??""}",
                         address:  home.home.value?.completeorder?[ind].address,
                         buttonText: "",
                        );
                  }),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
