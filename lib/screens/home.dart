// ignore_for_file: prefer_const_constructors
import 'package:app/custom/button1.dart';
import 'package:app/custom/navig.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/custom/borderbox.dart';
import 'package:lottie/lottie.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        // ignore: sized_box_for_whitespace
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(1.0, -1),
            colors: [violet1, violet2],
          )),
          child: CustomPaint(
            painter: CurvedPainter(),
            size: size,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        BorderBox(
                          col: blue1,
                          padding: EdgeInsets.all(5),
                          height: 60,
                          width: 60,
                          child: Icon(
                            Icons.menu,
                            color: Colors.blue.shade900,
                            size: 40,
                          ),
                        ),
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 16, bottom: 5),
                              child: Text(
                                "Create your QR code Now",
                                style: TextStyle(
                                    color: oceanblue,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    shadows: [
                                      Shadow(
                                        color: shadow_grey,
                                        offset: Offset(4, 4),
                                        blurRadius: 5,
                                      )
                                    ]),
                              ),
                            ),
                            Text(
                              "Fastest Scan your QR, Bar codes.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  shadows: [
                                    Shadow(
                                      color: shadow_grey,
                                      offset: Offset(4, 4),
                                      blurRadius: 5,
                                    )
                                  ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 100),
                    child: Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_vzjElM.json',
                    ),
                  ),
                  Column(
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ButtonA(
                            col: oceanblue,
                            padding: EdgeInsets.only(left: 30),
                            radius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(70),
                              bottomLeft: Radius.circular(120),
                              bottomRight: Radius.circular(70),
                            ),
                            txt: 'Scan QR Code'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ButtonA(
                              col: blue1,
                              padding: EdgeInsets.only(right: 30),
                              radius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(120),
                              ),
                              txt: 'Scan BarCode'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ButtonA(
                              col: oceanblue,
                              padding: EdgeInsets.only(left: 30),
                              radius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(70),
                                bottomLeft: Radius.circular(120),
                                bottomRight: Radius.circular(70),
                              ),
                              txt: 'Generate QR Code'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ButtonA(
                              col: blue1,
                              padding: EdgeInsets.only(right: 30),
                              radius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(120),
                              ),
                              txt: 'History'),
                        ),
                      ),
                    ],
                  ),
                  // Stack(
                  //   children: [
                  //     CustomPaint(
                  //       size: Size(size.width, 70),
                  //       painter: CurvedPainter(),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    // Path mainBackground = Path();
    // mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    // paint.color = violet1;
    // canvas.drawPath(mainBackground, paint);

    var shadow = Paint()
      ..color = shadowgrey
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
    canvas.drawCircle(Offset(10, height - 10), 203, shadow);

    var paint1 = Paint()
      ..color = circle2
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(30, height - 20), 200, paint1);

    var paint2 = Paint()
      ..color = circle1
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(width - 100, height - 100), 200, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
