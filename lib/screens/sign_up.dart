import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rudhira/components/text_form_field.dart';
import '../components/buttons.dart';
import 'home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final auth = FirebaseAuth.instance;
TextEditingController userEmail = TextEditingController();
TextEditingController userPassword = TextEditingController();
TextEditingController confirmUserPassword = TextEditingController();
TextEditingController userName = TextEditingController();

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 90,
            ),
            Hero(
              tag: "Logo",
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                minRadius: 70,
                child: Icon(
                  FontAwesomeIcons.droplet,
                  size: 90,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomTextFormField(
              controller: userName,
              hintText: "Enter User Name",
              labelText: "User Name",
              prefixIcon: Icons.person,
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: userEmail,
              labelText: "Email",
              hintText: "Enter Email",
              prefixIcon: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: "Password",
                hintText: "Enter Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: confirmUserPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: "Confirm Password",
                hintText: "Confirm Password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 30,
            ),
            Hero(
              tag: "SIGNUP",
              child: Button(
                text: "Sign Up",
                action: () async {
                 // await signUp(userEmail.text, userPassword.text);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signUp(String email, String password) async {
  await auth.createUserWithEmailAndPassword(email: email, password: password);
}
