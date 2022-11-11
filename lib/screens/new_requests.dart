import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rudhira/components/buttons.dart';
import '../components/text_form_field.dart';
import 'package:rudhira/constants.dart';
import 'package:rudhira/main.dart';

class NewRequests extends StatefulWidget {
  const NewRequests({Key? key}) : super(key: key);

  @override
  State<NewRequests> createState() => _NewRequestsState();
}

class _NewRequestsState extends State<NewRequests> {
  String dropdownvalue = bloodGroup[0];

  @override
  Widget build(BuildContext context) {

    TextEditingController needyName = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                SizedBox(height: 65),
                CircleAvatar(
                  backgroundColor: Colors.red, minRadius: 70,
                  child: Icon(
                    FontAwesomeIcons.droplet,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 100),
                CustomTextFormField(labelText: "Name", prefixIcon: Icons.person,
                hintText: "Enter Needy's Name", controller: needyName, inputType: TextInputType.text),
                SizedBox(height : 50),
                CustomTextFormField(labelText: "Phone Number", prefixIcon: Icons.phone,
                  hintText: "Enter Contact Number", controller: phoneNumber, inputType: TextInputType.phone),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Blood Group : ", style: TextStyle(fontSize: 25, color: Colors.redAccent), ),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: bloodGroup.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height : 30),
                Button(text:"Post Request", action: (){}),

              ],

          ),

        ),
      ),



    );
  }
}
