import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/historyPage.png'),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/me0001.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 50,),
                Text('I am Saptyadeep Bhattacharjee, developer of QReasy, to make scanning an generating QR codes and Barcodes super cool, Will love to be rated and get you valuable review.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: violet1,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                SizedBox(height: 70,),
                Text('Icon made by Freepik from www.flaticon.com'),
                Text('Icon made by Pixel perfect from www.flaticon.com')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
