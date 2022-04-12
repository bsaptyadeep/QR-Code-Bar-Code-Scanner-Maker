import 'package:app/screens/generate_menu.dart';
import 'package:app/screens/history.dart';
import 'package:app/screens/scanner.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants.dart';

class ButtonA extends StatelessWidget {
  final Color col;
  final EdgeInsets padding;
  final BorderRadius radius;
  final String txt;
  const ButtonA(
      {Key? key,
      required this.col,
      required this.padding,
      required this.radius,
      required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: MaterialButton(
        minWidth: 220,
        height: 60,
        // alignment: Alignment.center,
        child: Text(txt,
            style: const TextStyle(
                color: violet1, fontWeight: FontWeight.bold, fontSize: 15)),
        color: col,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: radius),
        onPressed: () {
          if (txt == 'Scan QR Code') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Scanner()),
            );
          }
          if (txt == 'Scan BarCode') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Scanner()),
            );
          }
          if (txt == 'Generate QR Code') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GenMenu()),
            );
          }
          if (txt == 'History') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HisPage()),
            );
          }
        },
      ),
    );
  }
}
