// main.dart
import 'package:flutter/material.dart';
import 'features/wallet_management/screen/WalletScreen.dart';
import 'features/money_transfer/screen/SendMoneyScreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
       theme: ThemeData.dark(),
      home: WalletScreen(), // This now uses the complete WalletScreen from the file
      routes: {
        '/sendMoney': (context) => SendMoneyScreen(),
      },
    );
  }
}
