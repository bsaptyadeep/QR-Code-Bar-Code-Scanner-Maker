import 'package:app/functions/database_helper.dart';
import 'package:app/models/model1.dart';
import 'package:app/screens/generate.dart';
import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';

class MyCustomFormwifi extends StatefulWidget {
  const MyCustomFormwifi({Key? key}) : super(key: key);

  @override
  MyCustomFormwifiState createState() {
    return MyCustomFormwifiState();
  }
}

class MyCustomFormwifiState extends State<MyCustomFormwifi> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController controllerssid;
  late TextEditingController controllerpass;
  DatabaseHelper _dbHelper = DatabaseHelper();
  late String select="";
  String hintText = 'SELECT';
  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() {
    controllerssid = TextEditingController();
    controllerpass = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                    const Text('Enter your Wifi Details',
                        style: TextStyle(
                            color: blue2,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      controller: controllerssid,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          counterStyle: TextStyle(color: Colors.white),
                          // prefix: Text('https://'),
                          icon: Icon(
                            Icons.wifi,
                            color: Colors.white,
                          ),
                          hintText: 'SSID',
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
                          return 'Please enter SSID';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Container(
                        padding: const EdgeInsets.only(left: 60),
                        width: size.width-80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: blue2,
                          ),
                          child: DropdownButton<String>(
                            iconEnabledColor: violet1,
                            hint: Text(
                              hintText,
                              style: const TextStyle(
                                color: blue1,
                              ),
                            ),
                            items: <String>['WPA/WPA2', 'WEP', '-']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                hintText = val.toString();
                                select = val.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controllerpass,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          counterStyle: TextStyle(color: Colors.white),
                          // prefix: Text('https://'),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintText: 'Enter the Password',
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
                          return 'Please enter the Password';
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
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                          ),
                      ),
                      onPressed: () async{
                        if (_formKey.currentState!.validate()) {
                          int _hisId = (await _dbHelper.idlast()) + 1;
                          History newHis = History(id: _hisId, oper: 'Generate', txt: 'SSID: ${controllerssid.text}\n$select\nPassword: ${controllerpass.text}', date: '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
                          _hisId = await _dbHelper.insertHis(newHis);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Generate(val: 'SSID: ${controllerssid.text}\n$select\nPassword: ${controllerpass.text}')),
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
