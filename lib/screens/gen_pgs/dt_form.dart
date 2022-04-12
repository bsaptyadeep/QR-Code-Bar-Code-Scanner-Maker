import 'package:app/functions/database_helper.dart';
import 'package:app/models/model1.dart';
import 'package:app/screens/generate.dart';
import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';

// Create a Form widget.
class MyCustomFormdt extends StatefulWidget {
  const MyCustomFormdt({Key? key}) : super(key: key);

  @override
  MyCustomFormdtState createState() {
    return MyCustomFormdtState();
  }
}

class MyCustomFormdtState extends State<MyCustomFormdt> {
  // final _formKey = GlobalKey<FormState>();
  DatabaseHelper _dbHelper = DatabaseHelper();
  late TextEditingController controllermail;
  late DateTime date = DateTime(0);
  late TimeOfDay? time = null;

  String getTextTime() {
    // ignore: unnecessary_null_comparison
    if (time == null) {
      return 'Select Time of Day';
    } else {
      return '${time!.hour}:${time!.minute}';
    }
  }

  String getText() {
    // ignore: unnecessary_null_comparison
    if (date == DateTime(0)) {
      return 'Select Date';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() {
    controllermail = TextEditingController();
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
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text('Select the Date and Time',
                    style: TextStyle(
                        color: blue2,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    minWidth: 200,
                    color: Colors.white,
                    onPressed: () {
                      pickDate(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getText(),
                          style: const TextStyle(
                            color: violet1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.calendar_today,
                          color: violet2,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    minWidth: 200,
                    color: Colors.white,
                    onPressed: () {
                      pickTime(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTextTime(),
                          style: const TextStyle(
                            color: violet1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.watch_later,
                          color: violet2,
                        ),
                      ],
                    ),
                  ),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  onPressed: () async{
                    if (date!=DateTime(0)) {
                      int _hisId = (await _dbHelper.idlast()) + 1;
                          History newHis = History(id: _hisId, oper: 'Generate', txt: 'Date: $date \n Time: $time', date: '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
                          _hisId = await _dbHelper.insertHis(newHis);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Generate(val: 'Date: $date \n Time: $time')),
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
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 100));
    if (newDate == null) return;

    setState(() {
      date = newDate;
    });
  }

  Future pickTime(BuildContext context) async {
    final initialTime =
        TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final newTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (newTime == null) {
      return;
    }

    setState(() {
      time = newTime;
    });
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
