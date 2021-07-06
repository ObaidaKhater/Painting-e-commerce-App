import 'package:flutter/material.dart';

class CloseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
        padding: EdgeInsets.all(10),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Image.asset('assets/icons/icon_close.png'),
      ),
    );
  }
}
