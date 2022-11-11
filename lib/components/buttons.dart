import 'package:flutter/material.dart';


class Button extends StatelessWidget {

  String? text ;
  Function? action;


  Button({this.text, this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: (){
          if(action != null) {
            action!();
          }
        },
        child: Text(
          text!,
          style: const TextStyle(color: Colors.red),
        ),
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.red, width: 1.5, style: BorderStyle.solid),
            ),
          ),
        ),
      ),
    );
  }
}
