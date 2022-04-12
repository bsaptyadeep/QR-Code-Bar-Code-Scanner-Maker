
import 'package:app/screens/gen_pgs/dt_form.dart';
import 'package:app/screens/gen_pgs/face_form.dart';
import 'package:app/screens/gen_pgs/mail_form.dart';
import 'package:app/screens/gen_pgs/phno_form.dart';
import 'package:app/screens/gen_pgs/sms_form.dart';
import 'package:app/screens/gen_pgs/txt_form.dart';
import 'package:app/screens/gen_pgs/url_form.dart';
import 'package:app/screens/gen_pgs/wifi_form.dart';
import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';

class GenButt extends StatefulWidget {
  final double height;
  final double width;
  final AssetImage img;
  final Color col;
  final String txt;
  const GenButt(
      {Key? key,
      required this.height,
      required this.width,
      required this.img,
      required this.col,
      required this.txt})
      : super(key: key);

  @override
  State<GenButt> createState() => _GenButtState();
}

class _GenButtState extends State<GenButt> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (widget.txt == 'Website Url') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomForm()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
        if (widget.txt == 'Wifi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomFormwifi()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
        if (widget.txt == 'Phone\nNumber') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomFormphno()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
        if (widget.txt == 'Facebook\nPost') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomFormface()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
        if (widget.txt == 'Plain text') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomFormtxt()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
        if (widget.txt == 'SMS') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomFormsms()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
        if (widget.txt == 'E-mail') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomFormmail()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
        if (widget.txt == 'Date and\nTime') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyCustomFormdt()),
          ).then(
            (value) {
              setState(() {});
            },
          );
          // Navigator.of(context).pop();
        }
      },
      color: widget.col,
      elevation: 0,
      minWidth: widget.width,
      height: widget.height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
              image: widget.img,
              height: 50,
              width: 50,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child: Text(
              widget.txt,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: blue1,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
