import 'package:flutter/material.dart';


class CustomButtonWidget extends StatelessWidget {
  Function onTap;
  String label;

  CustomButtonWidget({@required this.onTap, @required this.label});

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
          onPressed: this.onTap,
          child: Text(
            this.label,
            style: Theme.of(context).textTheme.subtitle2,
          )),
    );
  }
}
