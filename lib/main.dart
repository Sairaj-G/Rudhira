import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/buttons.dart';
import 'screens/login_page.dart';
import 'package:rudhira/screens/sign_up.dart';


const String loginPageHeading = "RUDHIRA";

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                loginPageHeading,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Hero(
              tag : "Logo",
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
              height: 30,
            ),

            Hero(tag : "LOGIN",
                child: Button (text: "LOG IN", action : (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));})),

            const SizedBox(
              height: 15,
            ),

            Hero(tag: "SIGNUP",
                child: Button(text: "SIGN UP", action: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));})),

          ],
        ),
    );
  }
}

