import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            backgroundColor:
            MaterialStateProperty.all<Color>(Color(0xFFFFDFD8)),
          ),
          onPressed: () {},
          child: Text('SHOP NOW',style: Theme.of(context).textTheme.subtitle2,)),
    );
  }
}
