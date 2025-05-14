
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:urbancare_delivery_boy/static/app_color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colo.white),),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text("No Notification"),)
//       body: ListView.builder(itemBuilder: (context,index){
// return Padding(
//   padding: const EdgeInsets.only(left: 16,right: 16,bottom: 
//   8),
//   child: Ink(
    
//     decoration: BoxDecoration(
//       color: Colo.white,
//       boxShadow: [
//         BoxShadow(
//           color: Colo.black,
//           blurRadius: 2 
//           )
//       ],
//       borderRadius: BorderRadius.circular(12)
//     ),
//     child: ListTile(
//       // contentPadding: EdgeInsets.zero,
//       dense: true,
//       // tileColor: Colors.orange[200],
//       title:Text("Title"),
//       subtitle: Text("Sub Title"),
    
//     ),
//   ),
// );
//       }),
    
    );
  }
}