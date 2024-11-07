import 'package:flutter/material.dart';
import '../widgets/AmountInputWidget.dart';
import '../widgets/KeypadWidget.dart';
import 'package:intl/intl.dart'; // Import intl package
import '../../../core/global_component/ButtonComponent.dart';

class SendMoneyScreen extends StatefulWidget {
  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  String amount = "0"; // Nilai awal

void updateAmount(String value) {
  setState(() {
    if (value == 'backspace') {
      // Handle backspace for deleting characters
      if (amount.isNotEmpty) {
        amount = amount.substring(0, amount.length - 1);
        if (amount.isEmpty) {
          amount = "0";
        }
      }
    } else if (RegExp(r'^\d+$').hasMatch(value) || value == '.') {
      // Append numeric input or decimal point to the amount
      if (amount == "0") {
        // Replace initial "0" if present
        amount = value;
      } else {
        // Concatenate the new input
        amount += value;
      }
    } else {
      // Handle preset amounts (e.g., 10, 20)
      double currentAmount = double.tryParse(amount.replaceAll(',', '')) ?? 0;
      double addition = double.parse(value);
      currentAmount += addition;
      amount = currentAmount.toStringAsFixed(2);
    }

    // Format the amount with commas after editing
    double formattedAmount = double.tryParse(amount.replaceAll(',', '')) ?? 0;
    amount = NumberFormat("#,##0.##").format(formattedAmount);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E0D15),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1F28),
        elevation: 0,
        title: Text("Send Money",
            style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Amount Section
            AmountInputWidget(amount: amount),
            SizedBox(height: 20),

            // Profile Section with name and divider
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/husain.png'),
                        radius: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Husain",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
                color: Colors.grey[800],
                thickness: 1),
            SizedBox(height: 10),

            // Preset Amount Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [10, 20, 50, 100].map((amount) {
                return ElevatedButton(
                  onPressed: () {
                    updateAmount(amount.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1C1F28),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "\$$amount",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Keypad
            Expanded(
              child: KeypadWidget(
                onKeyPressed: (value) => updateAmount(value),
              ),
            ),

            // Pay Now Button with Gradient
            Container(
              height: 80,
              margin: EdgeInsets.only(bottom: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 92, 224, 193),
                    Color(0xFF00BFA5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(64.0),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
