import 'package:flutter/material.dart';

class HisMsg extends StatelessWidget {
  final String txt;
  final String oper;
  final String date;
  const HisMsg(
      {Key? key, required this.txt, required this.oper, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: oper == 'Generate'
                      ? Color.fromRGBO(255, 0, 0, 1)
                      : Color.fromRGBO(76, 47, 255, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '$oper',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$txt',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$date',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
