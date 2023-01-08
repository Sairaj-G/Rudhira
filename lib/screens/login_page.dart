import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rudhira/components/buttons.dart';
import 'package:rudhira/components/text_form_field.dart';
import 'package:rudhira/screens/sign_up.dart';
import 'home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

TextEditingController userEmail = TextEditingController();
TextEditingController userPassword = TextEditingController();

final auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 140,
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
              height: 70,
            ),
            CustomTextFormField(
                controller: userEmail,
                hintText: "Enter Email",
                labelText: "Email",
                inputType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined),
            SizedBox(
              height: 30,
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
            Hero(
              tag: "LOGIN",
              child: Button(
                text: "Login",
                action: () async {
                  //await signIn(userEmail.text, userPassword.text);
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

Future<void> signIn(String email, String password) async {
  await auth.signInWithEmailAndPassword(email: email, password: password);
}
