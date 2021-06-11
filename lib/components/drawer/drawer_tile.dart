import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Route pageRoute;

  DrawerTile(this.icon, this.text, this.pageRoute);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(pageRoute);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: Color(0xFF6B6B6B),
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0, color: Color(0xFF6B6B6B)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
