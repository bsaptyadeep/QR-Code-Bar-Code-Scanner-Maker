import 'package:app/utils/color_const.dart';
import 'package:app/widgets/banners/banner_1.dart';
import 'package:app/widgets/buttons/button2.dart';
import 'package:flutter/material.dart';

class GenMenu extends StatelessWidget {
  const GenMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.center,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(206, 229, 255, 1)
              ],
              // center: Alignment(1.0, 1.0),
            )),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Banner1(),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Easy share and save in any device.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: blue1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/internet.png'),
                        col: Colors.white,
                        txt: 'Website Url'),
                    const SizedBox(
                      width: 50,
                    ),
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/wifi.png'),
                        col: Colors.white,
                        txt: 'Wifi')
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/phone.png'),
                        col: Colors.white,
                        txt: 'Phone\nNumber'),
                    const SizedBox(
                      width: 50,
                    ),
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/facebook.png'),
                        col: Colors.white,
                        txt: 'Facebook\nPost')
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/text.png'),
                        col: Colors.white,
                        txt: 'Plain text'),
                    const SizedBox(
                      width: 50,
                    ),
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/sms.png'),
                        col: Colors.white,
                        txt: 'SMS')
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/email.png'),
                        col: Colors.white,
                        txt: 'E-mail'),
                    const SizedBox(
                      width: 50,
                    ),
                    GenButt(
                        height: size.height / 5.5,
                        width: size.width / 3,
                        img: const AssetImage('assets/images/datetime.png'),
                        col: Colors.white,
                        txt: 'Date and\nTime')
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
