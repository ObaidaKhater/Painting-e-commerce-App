import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                child: Text('All'),
              ),
              Container(
                child: Row(
                  children: [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                    Text('4'),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
