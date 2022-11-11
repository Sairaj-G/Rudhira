import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {

  String? needyName;
  String? contactNumber;
  String? bloodGroup;

  RequestWidget({this.needyName, this.contactNumber, this.bloodGroup});



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(bloodGroup!),
        title: Text(needyName!),
        subtitle: Text(contactNumber!),
      ),
    );
  }
}
