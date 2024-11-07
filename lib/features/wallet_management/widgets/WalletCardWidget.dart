// features/wallet_management/widgets/WalletCardWidget.dart
import 'package:flutter/material.dart';
import '../../../datadummy/datadummy.dart'; // Import file datadummy

class WalletCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 29, 29, 29),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Available Balance section with horizontal padding
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  "Available Balance",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "\$${dummyCardInfo.balance.toStringAsFixed(2)}", // Mengambil balance dari dummyCardInfo
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Card details section with icon and VISA logo
          Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
            decoration: BoxDecoration(
              color: Color(0xFF21242C),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/iconcard.png',
                      width: 80,
                      height: 50,
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/images/visalogo.png',
                      width: 80,
                      height: 50,
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Text(
                  dummyCardInfo.cardNumber, // Mengambil nomor kartu dari dummyCardInfo
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dummyCardInfo.cardHolder, // Mengambil nama pemilik dari dummyCardInfo
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      dummyCardInfo.expiryDate, // Mengambil tanggal kedaluwarsa dari dummyCardInfo
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Row of icon buttons and Send button with horizontal padding
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Row(
              children: [
                // Icon button (e.g., transaction history)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2A2A), // Dark button background
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/wallet.png', // Ensure this path is valid and available
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(width: 10),

                // Icon button (e.g., other action)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2A2A), // Dark button background
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/donation.png', // Ensure this path is valid and available
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(width: 20),

                // Send Button with custom styling
                Expanded(
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 119, 221, 197),
                          Color(0xFF00BFA5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(64.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sendMoney');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(0, 240, 0, 0),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Send",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
