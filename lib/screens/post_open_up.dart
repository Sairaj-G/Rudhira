import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:rudhira/components/buttons.dart';
import 'package:rudhira/components/functions.dart';

class PostOpenUp extends StatefulWidget {

  String? bloodGroup;
  String? needyName;
  String? phoneNumber;

  PostOpenUp({this.needyName, this.phoneNumber, this.bloodGroup});

  @override
  State<PostOpenUp> createState() => _PostOpenUpState();
}

class _PostOpenUpState extends State<PostOpenUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("Donate"), backgroundColor: Colors.redAccent,),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.needyName!, style: TextStyle(fontSize: 30)),
              ],
            ),
            SizedBox(height: 30),
            TextButton(onPressed: ()async {
              FlutterPhoneDirectCaller.callNumber(widget.phoneNumber!);}, child: Text(widget.phoneNumber!, style: TextStyle(fontSize: 30),)),
            SizedBox(height: 20),

            Button(text: "Donate", action: (){})
          ],
        ),
      )
    );
  }
}
