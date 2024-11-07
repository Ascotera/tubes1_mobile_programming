import 'package:flutter/material.dart';

class KeypadWidget extends StatelessWidget {
  final Function(String) onKeyPressed;

  KeypadWidget({required this.onKeyPressed});

  final List<Map<String, dynamic>> keypadItems = [
    {'label': '1'},
    {'label': '2'},
    {'label': '3'},
    {'label': '4'},
    {'label': '5'},
    {'label': '6'},
    {'label': '7'},
    {'label': '8'},
    {'label': '9'},
    {'label': '.'},
    {'label': '0'},
    {'icon': Icons.backspace},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      itemCount: keypadItems.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = keypadItems[index];
        return ElevatedButton(
          onPressed: () {
            if (item.containsKey('icon')) {
              onKeyPressed('backspace');
            } else {
              onKeyPressed(item['label']);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff1C1F28),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          child: item.containsKey('icon')
              ? Icon(item['icon'], color: Colors.white, size: 24)
              : Text(
                  item['label'],
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
        );
      },
    );
  }
}
