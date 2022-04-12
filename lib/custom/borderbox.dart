// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;
  final Color col;

  const BorderBox(
      {Key? key,
      required this.padding,
      required this.height,
      required this.width,
      required this.child,
      required this.col})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      color: col,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: padding,
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      child: Center(
        child: child,
      )
    );
  }
}
