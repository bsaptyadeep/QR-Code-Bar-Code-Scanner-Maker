import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';

class Banner1 extends StatelessWidget {
  const Banner1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
            BoxShadow(
              color: blue1_fade,
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
            )
        ],
      ),
      child: SizedBox(
        height: 100,
        width: size.width - 80,
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.qr_code_scanner,
                  color: blue1,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            const Text(
              'Create Shareable\n QR Codes:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            )
          ],
        ),
      ),
    );
  }
}
