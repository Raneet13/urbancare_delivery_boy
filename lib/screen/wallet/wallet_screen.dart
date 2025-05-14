import 'package:flutter/material.dart';
// Import the SubscriptionProvider
import 'package:intl/intl.dart';

import '../../static/app_color.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/wallet';

  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<ProfileProvider>(context, listen: false).viewWalletHistory();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // final walletProvider = Provider.of<WalletProvider>(context);
    // final wallet = walletProvider.wallet;
    // final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    // final currentSubscription = subscriptionProvider.currentSubscription;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Wallet',
          style: TextStyle(color: Colo.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colo.white),
        centerTitle: true,
        // backgroundColor: primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colo.white),
            tooltip: 'Transaction History',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => TransactionHistoryPage()),
              // );
            },
          ),
        ],
      ),
      body:Column(
            children: [
              _buildBalanceSection(100),
              // const Divider(), 
              // _buildCurrentSubscriptionSection(),
             
              const Divider(),
              Expanded(child: _buildAddFundsSection(context)),
              // Removed Transaction History Section
            ],
          ),
        
      
    );
  }

  /// Builds the wallet balance section
  Widget _buildBalanceSection(balance) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      color: Colors.grey[100],
      child: Column(
        children: [
          const Icon(
            Icons.account_balance_wallet,
            size: 50,
            color:Colo.primaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Wallet Balance',
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            '₹ ${balance}',
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colo.primaryColor),
          ),
        ],
      ),
    );
  }

  /// Builds the add funds section
  Widget _buildAddFundsSection(BuildContext context) {
    final TextEditingController amountController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          // final txn = transactions[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: const Icon(Icons.arrow_downward, color: Colors.green),
              // txn.paymentAmount !=null? txn.paymentAmount! > 0
                  // ? const Icon(Icons.arrow_downward, color: Colors.green)
                  // : const Icon(Icons.arrow_upward, color: Colors.red):null,
              title: Text("orderName"),
              // subtitle: Text(
              //   DateFormat('yyyy-MM-dd hh:mm a').format(txn.createdAt!),
              // ),
              trailing: Text("100",
              // txn.paymentAmount !=null?  txn.paymentAmount! > 0
              //       ? '+ ₹${txn.paymentAmount!}'
              //       : '- ₹${txn.paymentAmount!.abs().toStringAsFixed(2)}':"",
                style: TextStyle(color:Colors.green,
                  // color:txn.paymentAmount !=null? txn.paymentAmount! > 0 ? Colors.green : Colors.red:null,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds the current subscription section
  Widget _buildCurrentSubscriptionSection() {
    // return const Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       children: [
    //         Text(
    //           'No Current Subscription',
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(height: 12),
    //         Text(
    //           'Subscribe to a plan to enjoy premium features!',
    //           style: TextStyle(color: Colors.grey),
    //           textAlign: TextAlign.center,
    //         ),
    //       ],
    //     ),
    //   );
    

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Current Subscription',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text("packageName",
                style: const TextStyle(fontSize: 16,color: Colors.black),
              ),
              // const SizedBox(height: 8),
              // Text(
              //   'Active until: ${DateFormat('yyyy-MM-dd').format(subscription.endDate)}',
              //   style: const TextStyle(color: Colors.grey),
              // ),
              const SizedBox(height: 8),
              Text(
                'Amount Paid: ₹${500}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // const SizedBox(height: 12),
              // ElevatedButton(
              //   onPressed: () {
              //     // Add logic to renew subscription
              //     // This could open a dialog or navigate to a subscription selection page
              //     // For demonstration, we'll show a simple dialog
              //     _showRenewSubscriptionDialog;
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: primary,
              //   ),
              //   child: Text('Renew Subscription'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows a dialog to renew the subscription
  void _showRenewSubscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Renew Subscription'),
        content: const Text('Would you like to renew your subscription?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the renewal logic here
              // For example, navigate to a subscription plans page
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Subscription renewed successfully!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colo.primaryColor,
            ),
            child: Text('Renew'),
          ),
        ],
      ),
    );
  }
}
