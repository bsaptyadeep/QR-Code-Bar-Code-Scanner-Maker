import 'package:app/functions/database_helper.dart';
import 'package:app/models/model1.dart';
import 'package:app/screens/generate.dart';
import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';

// Create a Form widget.
class MyCustomFormsms extends StatefulWidget {
  const MyCustomFormsms({Key? key}) : super(key: key);

  @override
  MyCustomFormsmsState createState() {
    return MyCustomFormsmsState();
  }
}

class MyCustomFormsmsState extends State<MyCustomFormsms> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController controllerno;
  late TextEditingController controllersms;
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() {
    controllerno = TextEditingController();
    controllersms = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(1.0, -1),
            colors: [violet1, violet2],
          )),
          child: CustomPaint(
            painter: CurvedPainter(),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    const Text('Enter your SMS',
                        style: TextStyle(
                            color: blue2,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      minLines: 8,
                      maxLines: 12,
                      controller: controllersms,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          counterStyle: TextStyle(color: Colors.white),
                          // prefix: Text('https://'),
                          icon: Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                          hintText: 'Type the message here .......',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some message';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: controllerno,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          counterStyle: TextStyle(color: Colors.white),
                          // prefix: Text('https://'),
                          icon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          hintText: 'Enter the Phone Number',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Phone Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      color: blue2,
                      minWidth: 200,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: const Text(
                        'Create QR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                          int _hisId = (await _dbHelper.idlast()) + 1;
                          History newHis = History(id: _hisId, oper: 'Generate', txt: 'SMS: ${controllersms.text}\n tel: ${controllerno.text}', date: '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
                          _hisId = await _dbHelper.insertHis(newHis);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Generate(val: 'SMS: ${controllersms.text}\n tel: ${controllerno.text}')),
                          ).then(
                            (value) {
                              setState(() {});
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
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
