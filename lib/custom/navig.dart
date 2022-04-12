import 'package:app/screens/credits.dart';
import 'package:app/screens/history.dart';
import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: sky1,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 60),
            buildMenuItem(
              txt: 'History',
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(height: 30),
            Divider(
              color: violet1,
            ),
            SizedBox(height: 30),
            buildMenuItem(
              txt: 'About the Developer',
              onClicked: _launchURL
            ),
            buildMenuItem(
              txt: 'Credits',
              onClicked: () => selectedItem(context, 2)
            )
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({required String txt, VoidCallback? onClicked}) {
  final color = Colors.white;
  final hoverColor = Colors.blue.shade300;
  return ListTile(
    title: Text(txt,
        style: TextStyle(color: violet1, fontWeight: FontWeight.bold)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HisPage()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Credits()),
      );
      break;
  }
}

_launchURL() async {
  const url = 'https://saptyadeep.netlify.app/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}