



import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Buttons extends StatelessWidget {
  final int color;

  final String number;

  final Function callback;

  const Buttons({super.key, required this.number,required this.color, required this.callback});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () => callback(number),
          child: "${number}".text.xl4.make(),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(70.00, 70.00),
              primary: Color(color),
              shape: CircleBorder())),
    );
  }
}



