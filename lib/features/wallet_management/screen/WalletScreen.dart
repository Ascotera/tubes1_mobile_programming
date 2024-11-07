// features/wallet_management/screen/WalletScreen.dart
import 'package:flutter/material.dart';
import '../widgets/WalletCardWidget.dart';
import '../../../datadummy/datadummy.dart'; // Import file datadummy

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E0D15),
      appBar: AppBar(
        title: Text("My Wallet"),
        backgroundColor: Color.fromARGB(0, 14, 13, 21),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WalletCardWidget(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 107, 106, 106),
                        fontSize: 18),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            // List untuk menampilkan transaksi
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: dummyTransactions.length,
                  itemBuilder: (context, index) {
                    final transaction = dummyTransactions[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          transaction.imagePath,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        transaction.name,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      subtitle: Text(
                        transaction.type,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      trailing: Text(
                        "${transaction.type == 'Income' ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: transaction.type == 'Income'
                              ? Colors.green
                              : Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
