import 'package:flutter/material.dart';

class AmountInputWidget extends StatelessWidget {
  final String amount;

  AmountInputWidget({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SGD", style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(width: 10),
            Text(
              "USD",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Text("EUR", style: TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
        SizedBox(height: 10),

        // Display updated amount with dollar sign
        Text(
          "\$ $amount",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Balance after the expense ",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              TextSpan(
                text: "\$500.00",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
